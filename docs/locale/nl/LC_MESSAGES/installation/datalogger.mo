��    *      l  ;   �      �     �     �  �   �  `   l  D   �  L     �   _       %      �   F  h   7  =   �     �  	   �  I   �  �   D      	  8   @	  �   y	  D   >
     �
     �
     �
  %   �
  j   �
  
   f  B   q  �   �  A   A  (   �  a   �  �     I   �  8     A   @  n   �  '   �  �     �   �  �   �  �     �  �     ^     {  �   �  V   6  P   �  ^   �  �   =     �  +   	  �   5  h     Z   �     �  
   �  Z        [     _  H   ~  �   �  I   �     �  !        (  +   G  k   s  
   �  I   �  �   4  K   �  0     t   P  �   �  a   �  9   �  `   *  w   �  =      �   A     �   �   �!  �   �"     *                   #             %                 	   &                
       $                                            '   (                      !                         )                    "    A. Serial port (``.env``) API config (``.env``) Add the schema (``http://``/``https://``) and hostname/port to ``DATALOGGER_API_HOSTS``. Add the API key to ``DATALOGGER_API_KEYS``. For example:: Also, you should disable the datalogger process over there, since you won't be using it anyway:: Are you using a cable to read telegrams directly from a serial port? Are you using a network socket for reading the telegrams? E.g.: ``ser2net``. Are you using the remote datalogger for multiple instances of DSMR-reader? Then use ``DATALOGGER_API_HOSTS`` and ``DATALOGGER_API_KEYS`` as comma separated lists:: B. Network socket (``.env``) Choose either ``A.`` or ``B.`` below. Create a new file ``/home/dsmr/dsmr_datalogger_api_client.py`` with the following contents: `dsmr_datalogger_api_client.py on GitHub <https://github.com/dsmrreader/dsmr-reader/blob/v4/dsmr_datalogger/scripts/dsmr_datalogger_api_client.py>`_ Create a new supervisor config in ``/etc/supervisor/conf.d/dsmr_remote_datalogger.conf`` with contents:: Create another file ``/home/dsmr/.env`` and add as contents:: Datalogger script Execute:: Have Supervisor reread and update its configs to initialize the process:: If your smart meter only supports DSMR v2 (or you are using a non Dutch smart meter), make sure to change the DSMR version :doc:`in the configuration<../configuration>` as well, to have DSMR-reader parse them correctly. Installation: Remote datalogger Keep the file open for multiple edits / additions below. Make sure to first prepare the API at the DSMR-reader instance you'll forward the telegrams to. You can enable the API and view/edit the API key used :doc:`in the configuration<../configuration>`. Or execute the following to download it directly to the path above:: Other settings (``.env``) Receiving DSMR-reader instance Remote datalogger device Serial port or network socket config? Set the hostname or IP address in ``DATALOGGER_NETWORK_HOST`` and the port in ``DATALOGGER_NETWORK_PORT``. Supervisor Switch to the device you want to install the remote datalogger on. The ``.env`` file below is not mandatory to use. Alternatively you can specify all settings mentioned below as system environment variables. The device (or server) hosting the receiving DSMR-reader instance The device hosting the remote datalogger The following steps are also meant for the device you've just installed the remote datalogger on. The remote datalogger script has been overhauled in DSMR-reader ``v4.1``. If you installed a former version, reconsider reinstalling it completely with the new version below. The script should now forward telegrams to the API host(s) you specified. Then add the following contents to ``/home/dsmr/.env``:: These settings are **optional** but can be tweaked when required: This will install a datalogger that will forward telegrams to a remote instance of DSMR-reader, using its API. To be clear, there should be two hosts: When using a different port or baud rate, change the ``DATALOGGER_SERIAL_PORT`` / ``DATALOGGER_SERIAL_BAUDRATE`` values accordingly. ``DATALOGGER_DEBUG_LOGGING``: Set to ``true`` or ``1`` to enable verbose debug logging. Omit to disable. Warning: Enabling this logging for a long period of time on a Raspberry Pi may cause accelerated wearing of your SD card! ``DATALOGGER_SLEEP``: The time in seconds that the datalogger will pause after each telegram written to the DSMR-reader API. Omit to use the default value. ``DATALOGGER_TIMEOUT``: The timeout in seconds that applies to reading the serial port and/or writing to the DSMR-reader API. Omit to use the default value. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
X-Generator: Poedit 2.0.6
 A. Seriële poort (``.env``) API-configuratie (``.env``) Voeg het schema (``http://``/``https://``) en hostnaam/poort toe aan ``DATALOGGER_API_HOSTS``. Voeg de API key toe aan ``DATALOGGER_API_KEYS``. Bijvoorbeeld:: Verder kun je hier het datalogger proces uitschakelen, gezien die toch niet nodig is:: Gebruik je een kabel om telegrammen direct vanaf de seriële poort uit te lezen? Gebruik je een netwerk socket voor het uitlezen van de telegrammen? Bijvoorbeeld: ``ser2net``. Gebruik je dezelfde remote datalogger voor meerdere instanties van DSMR-reader? Gebruik dan ``DATALOGGER_API_HOSTS`` en ``DATALOGGER_API_KEYS`` als komma-gescheiden lijsten:: B. Netwerk socket (``.env``) Kies hieronder voor ofwel ``A.`` of ``B.``. Maak een nieuw bestand ``/home/dsmr/dsmr_datalogger_api_client.py`` met deze inhoud: `dsmr_datalogger_api_client.py op GitHub <https://github.com/dsmrreader/dsmr-reader/blob/v4/dsmr_datalogger/scripts/dsmr_datalogger_api_client.py>`_ Maak een nieuwe Supervisor-config in ``/etc/supervisor/conf.d/dsmr_remote_datalogger.conf`` met inhoud:: Maak een ander bestand genaamd ``/home/dsmr/.env`` aan en zet daar de volgende inhoud in:: Datalogger script Voer uit:: Laat Supervisor zijn eigen instellingen uitlezen en doorvoeren, om het proces te starten:: Wanneer je slimme meter alleen DSMR v2 ondersteunt (of je gebruikt een niet-Nederlandse slimme meter), zorg er dan voor dat je de DSMR-versie aanpast :doc:`in de datalogger-configuratie <../configuration>`, zodat DSMR-reader de telegrammen goed kan verwerken. Installatie: Remote datalogger Houd het bestand open voor meerdere wijziginge / toevoegingen hieronder. Zorg ervoor dat je eerste de API van de ontvangende DSMR-reader-instantie klaar hebt staan. Je kunt daar de API inschakelen en bijbehorende API-sleutel inzien/bewerken :doc:`in de configuratie<../configuration>`. Of voer het volgende uit om het direct op bovenstaand pad te downloaden:: Overige instellingen (``.env``) Ontvangende DSMR-reader-instantie Apparaat met remote datalogger Seriële poort of netwerk socket instellen? Stel de hostnaam of IP-adres in als ``DATALOGGER_NETWORK_HOST``en de poort als ``DATALOGGER_NETWORK_PORT``. Supervisor Wissel naar het apparaat waarop je de remote datalogger wilt installeren. Je bent niet verplicht om het ``.env``-bestand te gebruiken. Als alternatief kun je alle instellingen hieronder ook als systeem-omgevingsvariabelen instellen. Het apparaat (of server) waarop de ontvangende DSMR-reader-instantie draait Het apparaat waar de remote datalogger op draait De stappen hieronder zijn eveneens bedoeld voor het apparaat waar je net de remote datalogger op geinstalleerd hebt. Het script voor de remote datalogger is op de schop gegaan in DSMR-reader ``v4.1``. Mocht je een eerdere versie gebruiken, overweeg dan om deze opnieuw te installeren met de nieuwere versie hieronder. Het script zou nu telegrammen moeten doorsturen naar de API host(s) die je eerder hebt ingevoerd. Voeg dan de volgende inhoud toe aan ``/home/dsmr/.env``:: De volgende instellingen zijn **optioneel** en kunnen naar wens aangepast worden, wanneer nodig: Dit installeert een datalogger, die telegrammen doorstuurt naar een installatie van DSMR-reader op afstand, via de API. Voor de duidelijkheid, er zouden twee omgevingen moeten zijn: Als je een andere poort of baud waarde gebruikt, wijzig dit dan in  ``DATALOGGER_SERIAL_PORT`` / ``DATALOGGER_SERIAL_BAUDRATE``. ``DATALOGGER_DEBUG_LOGGING``: Stel in op ``true`` of ``1`` om uitgebreide debug-logging in te schakelen. Laat weg om uit te schakelen. Waarschuwing: Indien voor langere tijd ingeschakeld kan dit bijdragen aan de slijtage van je SD-kaartje op een Raspberry Pi! ``DATALOGGER_SLEEP``: De tijd in seconden dat de remote datalogger pauseert, nadat deze een telegram naar de DSMR-reader API heeft verstuurt. Laat weg om de standaardwaarde te gebruiken. ``DATALOGGER_TIMEOUT``: De tijd in seconden dat maximaal gewacht wordt op de datalogger en de ontvangende DSMR-reader API. Laat weg om de standaardwaarde te gebruiken. 