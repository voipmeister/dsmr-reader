Changelog
=========

v1.0.0 - 2016-xx-xx
^^^^^^^^^^^^^^^^^^^
- Move documentation to wiki or RTD (#90).



v0.16 (β) - 2016-03-28
^^^^^^^^^^^^^^^^^^^^^^
- Redesign trends page (#97).
- Support for summer time (#105).
- Support for Daylight Saving Time (DST) transition (#104).
- Add (error) hints to status page (#106).
- Keep track of version (#108).


v0.15 (β) - 2016-03-24
^^^^^^^^^^^^^^^^^^^^^^
- Django 1.8.11 released (#82).
- Prevent tests from failing due to moment of execution (#88).
- Statistics page meter positions are broken (#93).
- Archive only shows graph untill 23:00 (11 pm) (#77).
- Trends page crashes due to nullable fields average (#100).
- Trends: Plot peak and off-peak relative to each other (#99).
- Monitor requirements with requires.io (#101).
- Terminology (#41).
- Obsolete signals in dsmr_consumption (#63).
- Individual app testing coverage (#64).
- Support for extra devices on other M-bus (0-n:24.1) (#92).
- Separate post-deployment commands (#102).


v0.14 (β) - 2016-03-13
^^^^^^^^^^^^^^^^^^^^^^
- Show exceptions in production (webinterface) (#87).
- Keep Supervisor processes running (#79).
- Hourly stats of 22:00:00+00 every day lack gas (#78).
- Test Travis-CI with MySQL + MariaDB + PostgreSQL (#54).
- PostgreSQL tests + nosetests + coverage failure: unrecognized configuration parameter "foreign_key_checks" (#62).
- Performance check (#83).
- Allow month & year archive (#66).
- Graphs keep increasing height on tablet (#89).


v0.13 (β) - 2016-03-06
^^^^^^^^^^^^^^^^^^^^^^
- Delete StatsSettings(.track) settings model (#71).
- Drop deprecated commands (#22).
- Datalogger doesn't work properly with DSMR 4.2 (KAIFA-METER) (#73).
- Dashboard month statistics costs does not add up (#75).
- Log unhandled exceptions and errors (#65).
- Datalogger crashes with IntegrityError because 'timestamp' is null (#74).
- Trends are always shown in UTC (#76).
- Squash migrations (#31).
- Display 'electricity returned' graph in dashboard (#81).
- Optional gas (and electricity returned) capabilities tracking (#70).
- Add 'electricity returned' to trends page (#84).


v0.12 (β) - 2016-03-01
^^^^^^^^^^^^^^^^^^^^^^
- Archive: View past days details (#61).
- Dashboard: Consumption total for current month (#60).
- Check whether gas readings are optional (#34).
- Django security releases issued: 1.8.10 (#68).
- Notes display in archive (#69).


v0.11 (β) - 2016-02-22
^^^^^^^^^^^^^^^^^^^^^^
- Status page/alerts when features are disabled/unavailable (#45).
- Integrate Travis CI (#48).
- Testing coverage (#38).
- Implement automatic backups & Dropbox cloud storage (#44).
- Link code coverage service to repository (#56).
- Explore timezone.localtime() as replacement for datetime.astimezone() (#50).
- Align GasConsumption.read_at to represent the start of hour (#40).


v0.10 (β) - 2016-02-15
^^^^^^^^^^^^^^^^^^^^^^
- Cleanup unused static files (#47).
- Investigated mysql_tzinfo_to_sql — Load the Time Zone Tables (#35).
- Make additional DSMR data optional (#46).
- Localize graph x-axis (#42).
- Added graph formatting string to gettext file (#42).
- Different colors for peak & off-peak electricity (#52).
- Admin: Note widget (#51).
- Allow GUI to run without data (#26).


v0.9 (β) - 2016-02-08
^^^^^^^^^^^^^^^^^^^^^
- Moved project to GitHub (#28).
- Added stdout to dsmr_backend to reflect progress.
- Restore note usage in GUI (#39).


v0.8 (β) - 2016-02-06
^^^^^^^^^^^^^^^^^^^^^
- Store daily, weekly, monthly and yearly statistics (#3).
- Improved Recent History page performance a bit. (as result of #3)
- Updates ChartJS library tot 1.1, disposing django-chartjs plugin. Labels finally work! (as result of #3)
- Added trends page. (as result of #3)


v0.7 (β) - 2016-02-04
^^^^^^^^^^^^^^^^^^^^^
- Recent history setting: set range (#29).
- Mock required for test: dsmr_weather.test_weather_tracking (#32).


v0.6 (β) - 2016-02-03
^^^^^^^^^^^^^^^^^^^^^
- Massive refactoring: Separating apps & using signals (#19).
- README update: Exit character for cu (#27, by Jeroen Peters).
- Fixed untranslated strings in admin interface.
- Upgraded Django to 1.8.9.


v0.5 (β) - 2016-01-16
^^^^^^^^^^^^^^^^^^^^^
- First stable release.