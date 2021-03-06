from django.db import models
from django.utils.translation import ugettext_lazy as _
from solo.models import SingletonModel
from colorfield.fields import ColorField


class FrontendSettings(SingletonModel):
    """ Singleton model restricted by django-solo plugin. Settings for this application only. """
    reverse_dashboard_graphs = models.BooleanField(
        default=False,
        verbose_name=_('Reverse dashboard graphs'),
        help_text=_('Whether graphs are rendered with an reversed X-axis')
    )
    merge_electricity_tariffs = models.BooleanField(
        default=False,
        verbose_name=_('Merge electricity tariffs'),
        help_text=_('Whether you are using a single electricity tariff and both (high/low) should be displayed merged')
    )

    electricity_delivered_color = ColorField(
        default='#F05050',
        verbose_name=_('Electricity delivered color'),
        help_text=_("Graph color for electricity delivered (default + high tariff)")
    )
    electricity_delivered_alternate_color = ColorField(
        default='#7D311A',
        verbose_name=_('Electricity delivered color (alternative)'),
        help_text=_("Graph color for electricity delivered (low tariff)")
    )
    electricity_returned_color = ColorField(
        default='#27C24C',
        verbose_name=_('Electricity returned color'),
        help_text=_("Graph color for electricity returned (default + high tariff)")
    )
    electricity_returned_alternate_color = ColorField(
        default='#C8C864',
        verbose_name=_('Electricity returned color (alternative)'),
        help_text=_("Graph color for electricity returned (low tariff)")
    )
    gas_delivered_color = ColorField(
        default='#FF851B',
        verbose_name=_('Gas delivered color'),
        help_text=_("Graph color for gas delivered")
    )
    temperature_color = ColorField(
        default='#0073B7',
        verbose_name=_('Temperature color'),
        help_text=_("Graph color for temperatures read")
    )

    def __str__(self):
        return self._meta.verbose_name.title()

    class Meta:
        default_permissions = tuple()
        verbose_name = _('Frontend configuration')
