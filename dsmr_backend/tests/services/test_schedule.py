from unittest import mock

from django.test import TestCase

from dsmr_backend.tests.mixins import InterceptStdoutMixin
from dsmr_backend.models.schedule import ScheduledProcess
import dsmr_backend.signals


class TestBackend(InterceptStdoutMixin, TestCase):
    @mock.patch('dsmr_backend.signals.backend_called.send_robust')
    @mock.patch('dsmr_backend.services.schedule.execute_scheduled_processes')
    def test_backend_creation_signal(self, exec_mock, signal_mock):
        """ Test outgoing signal and execute_scheduled_processes() being called. """
        self.assertFalse(signal_mock.called)
        self.assertFalse(exec_mock.called)
        self._intercept_command_stdout('dsmr_backend', run_once=True)
        self.assertTrue(signal_mock.called)
        self.assertTrue(exec_mock.called)

    @mock.patch('dsmr_backup.services.backup.check')
    @mock.patch('dsmr_backup.services.backup.sync')
    @mock.patch('dsmr_consumption.services.compact_all')
    @mock.patch('dsmr_mindergas.services.export')
    @mock.patch('dsmr_notification.services.notify')
    @mock.patch('dsmr_stats.services.analyze')
    @mock.patch('dsmr_weather.services.read_weather')
    def test_backend_creation_signal_receivers(self, *mocks):
        """ Test whether outgoing signal is received. """
        for current in mocks:
            self.assertFalse(current.called)

        self._intercept_command_stdout('dsmr_backend', run_once=True)

        for current in mocks:
            self.assertTrue(current.called)

    def test_robust_signal(self):
        """ Test whether the signal is robust, handling any exceptions. """

        def _fake_signal_troublemaker(*args, **kwargs):
            raise BrokenPipeError("Signal receiver crashed for some reason...")

        dsmr_backend.signals.backend_called.connect(receiver=_fake_signal_troublemaker)

        # We must disconnect to prevent other tests from failing, since this is no database action.
        dsmr_backend.signals.backend_called.disconnect(receiver=_fake_signal_troublemaker)

    @mock.patch('logging.Logger.exception')
    def test_signal_exception_handling(self, logging_mock):
        """ Tests signal exception handling. """
        def _fake_signal_troublemaker(*args, **kwargs):
            raise AssertionError("Crash")

        dsmr_backend.signals.backend_called.connect(receiver=_fake_signal_troublemaker)
        self.assertFalse(logging_mock.called)

        self._intercept_command_stdout('dsmr_backend', run_once=True)
        self.assertTrue(logging_mock.called)

    @mock.patch('dsmr_backend.signals.backend_called.send_robust')
    @mock.patch('logging.Logger.exception')
    @mock.patch('dsmr_backend.models.schedule.ScheduledProcess.execute')
    def test_execute_scheduled_processes_error(self, execute_mock, logging_mock, signal_mock):
        """ Test execute_scheduled_processes()'s exception handling. """
        ScheduledProcess.objects.create(name='test', module='fake.module')

        self.assertFalse(execute_mock.called)
        self.assertFalse(logging_mock.called)

        # OK.
        self._intercept_command_stdout('dsmr_backend', run_once=True)

        self.assertTrue(execute_mock.called)
        self.assertFalse(logging_mock.called)

        execute_mock.reset_mock()
        logging_mock.reset_mock()

        # Exception.
        execute_mock.side_effect = Exception("Chaos monkey")
        self._intercept_command_stdout('dsmr_backend', run_once=True)

        self.assertTrue(execute_mock.called)
        self.assertTrue(logging_mock.called)
