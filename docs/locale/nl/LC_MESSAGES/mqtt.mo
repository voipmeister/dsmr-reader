��          �            x     y     �  �   �  a   $  �   �       :   !     \  0   w  K   �  .   �     #     2  p   @     �  &  �     �  
   �  �     k   �  �   �     �  ;   �     �  ?   �  G   %  )   m     �     �  o   �     (	                                   
           	                                 Apply changes:: Change:: Execute ``sudo supervisorctl status`` and check whether it includes ``dsmr_mqtt`` with status ``RUNNING``. If not, continue with the steps below. Executing ``sudo supervisorctl status`` should now include ``dsmr_mqtt`` with status ``RUNNING``. Fresh installations automatically include the ``dsmr_mqtt`` process. Existing installations however, should add ``dsmr_mqtt`` manually. Instructions: MQTT Now execute the following commands as **root/sudo-user**:: Older versions (< v1.23.0) Only follow these step if you have enabled MQTT. Open ``/etc/supervisor/conf.d/dsmr-reader.conf`` (sudo required) and find:: Please upgrade to ``v1.23.0`` or higher first. Save the file. Starting MQTT Starting from ``v1.23.0`` DSMR-reader requires a dedicated process for processing MQTT messages (``dsmr_mqtt``). To:: Project-Id-Version: 
Report-Msgid-Bugs-To: EMAIL@ADDRESS
Last-Translator: 
Language: nl
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.0.6
 Pas de wijzigingen toe:: Verander:: Voer ``sudo supervisorctl status`` uit en controleer of je ``dsmr_mqtt`` ziet met status ``RUNNING``. Zo niet, volg de stappen hieronder. Wanneer je ``sudo supervisorctl status`` uitvoert, zou je ``dsmr_mqtt`` moeten zien met status ``RUNNING``. Nieuwe installaties hebben al de configuratie voor het ``dsmr_mqtt`` proces. Bestaande installaties moeten deze handmatig toevoegen. Instructies: MQTT Voer nu de volgende commando's uit als **root/sudo-user**:: Oudere versies (< v1.23.0) Voer deze stappen alleen uit wanneer je MQTT hebt ingeschakeld. Open ``/etc/supervisor/conf.d/dsmr-reader.conf`` (sudo nodig) en zoek:: Upgrade eerst naar  ``v1.23.0`` of hoger. Sla het bestand op. MQTT starten Vanaf DSMR-reader ``v1.23.0`` is er een toegewijd proces voor het versturen van MQTT-berichten (``dsmr_mqtt``). Naar:: 