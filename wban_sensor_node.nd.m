MIL_3_Tfile_Hdr_ 145A 140A modeler 6 531FD307 5554A3DE 68 IWCT307-WS8 Administrator 0 0 none none 0 0 none 73194ED4 517E 0 0 0 0 0 0 1bcc 1                                                                                                                                                                                                                                                                                                                                                                                     ��g�      8   <   [   _    #�  *:  9  B�  B�  B�  On       
fixed_comm����������������           MiscLog File Directory   �������   ����         Seafile      ����      ����         Seafile      D:\Seafile\wban_raw_data\      yuanbin       D:\Seafile\yuanbin\wban_raw_data      baiyu      D:\Seafile\baiyu\wban_raw_data      
liuwenlong      $D:\Seafile\liuwenlong\wban_raw_data\      duchen      D:\Seafile\duchen\wban_raw_data         TExisting directory path for storing an appropriate log file if a logging is enabled.�Z             MiscLog Level   �������   ����          	ESSENTIAL      ����      ����         	ESSENTIAL      0      VERBOSE      1         
Log level:   0: Essential     
1: Verbose�Z             
MACBAN ID    �������    ����   1         2          ����          ����         2      ����      3      ����      4      ����      5      ����      6      ����      7      ����      8      ����      9      	����      10      
����      11      ����      12      ����      13      ����      14      ����      15      ����      16      ����         lA hub shall select a one-octet body area network identifier (BAN ID) from an integer between 0x00 and 0xFF.    )Here we set it ranging from 0x02 to 0x10.�Z             MiscDevice Mode   �������   ����   0      Node      ����      ����         Hub      Hub      Node      Node         Two possible modes:     - Hub     - Node       dHub identifies its own wban (BAN ID) and provides synchronization through  the beacons transmission.�Z             
MACBeacon   �������   ����                  count    ���   
   ����   
      list   	���   
            
RAP1 Start    ���   
    ����   
      B2 Start    ���   
    ����   
   
                                 @This WBAN Settings compound attributes is only useful by a Hub.    DThe slaves only wait for these attributes be means of beacon frames.   count    �������    ����         ����         ����         ����           �Z             list   	�������   	����                                               Beacon Period Length    �������    ����         )����          ����          ����         32       ����      64      @����      128      �����         AThis value specifies the beacon orderr of the corresponding WPAN.   �Only the PAN Coordinator must specify this value. Then, it will be transmitted to other nodes using the beacon frame sychronization. �Z             Allocation Slot Length    �������    ����         ����          ����          ����           �Z             
RAP1 Start    �������    ����          ����          ����          ����             �This attributes specifies the PAN ID. It is only useful for the PAN Coordinator. The other nodes will get this value by means of the beacon frames.    BOnly the PAN Coordinator should specify a unique value for its PAN�Z             RAP1 End    �������    ����         �����          ����          ����           �Z             B2 Start    �������    ����          ����          ����          ����           �Z             
RAP2 Start    �������    ����          ����          ����          ����           �Z             Inactive Duration    �������    ����          ����          ����          ����           �Z          �Z          �Z             MACSender Address    �������    ����      ����   Auto Assigned          ����          ����         Auto Assigned   ��������         Sender address of the node.�Z             MACProtocol Version    �������    ����          ����          ����          ����         PAPER1      ����      BASE0       ����       �Z             PHYWBAN DATA RATE   �������   ����      @�[33333   971.4              ����              ����         121.4   @^Y���������      242.9   @n\���������      485.7   @~[33333����      971.4   @�[33333����       �Z             MACConnection Request   �������   ����                  count    ���   
   ����   
      list   	���   
            Allocation Length    ���   
   
����   
   
                                 GThis Connection Request compound attributes is useful by Hub and node.    count    �������    ����         ����         ����         ����           �Z             list   	�������   	����                                               Allocation Length    �������    ����         ����          ����          ����           �Z          �Z          �Z             MACConnection Assignment   �������   ����                  count    ���   
   ����   
      list   	���   
            
EAP2 Start    ���   
    ����   
   
                                 IThis Connection Asignment compound attributes is useful by Hub and node.    count    �������    ����         ����         ����         ����           �Z             list   	�������   	����                                               
EAP2 Start    �������    ����         ����          ����          ����           �Z          �Z          �Z             MACBeacon2   �������   ����                  count    ���   
   ����   
      list   	���   
          
                                 Beacon2 format   count    �������    ����         ����         ����         ����           �Z             list   	�������   	����                                               CAP End    �������    ����         �   255          ����          ����         0       ����      255      �����       �Z             MAP2 End    �������    ����          ����          ����          ����         255      �����      35      #����       �Z          �Z          �Z                   EnergyInitial Energy      Battery.Initial Energy����   ����               ����              ����              ����                         MACMax Packet Retry      ,wban_mac.MAC Attributes [0].Max Packet Tries����    ����           ����          ����          ����                        EnergyPower Supply      Battery.Power Supply����   ����               ����              ����              ����                        APPUP0      4Traffic Source_UP.User Priority 0 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP1      4Traffic Source_UP.User Priority 1 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP2      4Traffic Source_UP.User Priority 2 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP3      4Traffic Source_UP.User Priority 3 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP4      4Traffic Source_UP.User Priority 4 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP5      4Traffic Source_UP.User Priority 5 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP6      4Traffic Source_UP.User Priority 6 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       APPUP7      4Traffic Source_UP.User Priority 7 Traffic Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Initial Energy         @��        2 AA Batteries (1.5V, 1600 mAh)      Max Packet Retry             ����      Power Supply         @         2 AA Batteries (3V)      
TIM source            none      UP0                     count    ���   
   ����   
      list   	���   
          
      UP1                     count    ���   
   ����   
      list   	���   
          
      UP2                     count    ���   
   ����   
      list   	���   
          
      UP3                     count    ���   
   ����   
      list   	���   
          
      UP4         N            count    ���   
   ����   
      list   	���   n            	MSDU Size   ���   n   constant (960.0)   n      
Start Time   ���   
��         Infinity   
   n   N   UP5         N            count    ���   
   ����   
      list   	���   n          n   N   UP6         N            count    ���   
   ����   
      list   	���   n            	MSDU Size   ���   n   constant (960)   n      
Start Time   ���   n��         Infinity   n   n   N   UP7         
            count    ���   
   ����   
      list   	���   
          
   
   altitude         
@$      ����   
   altitude modeling            relative to subnet-platform      	condition            ����      financial cost            0.00      minimized icon            circle/#708090      phase                 ����      priority              ����      role         ����      user id              ����               �   �          
   wban_mac   
       
   wban_mac_process   
          queue                   MAC Attributes   ���   
            count    ���   
   ����   
      list   	���   
            Batterie Life Extension   ���   
    ����   
      Max Packet Tries    ���   	   ����   	   
   
   	     R  R          
   rx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A-�    ����   
      packet formats   ���   
   wban_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      processing gain   ���   
ԲI�%��}����   
   
   
       
   qpsk   
       ?�      ����                  ����             
dra_ragain             	dra_power          
   dra_bkgnoise   
       
   
dra_inoise   
       
   dra_snr   
       
   dra_ber   
       
   	dra_error   
       
   dra_ecc   
          ra_rx                       nd_radio_receiver            �  R          
   tx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A-�    ����   
      packet formats   ���   
   wban_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      power   ���   
?��Q������   
      pk capacity   ���   
T�I�%��}����   
   
   
       
   qpsk   
          dra_rxgroup             	dra_txdel          
   dra_closure   
          dra_chanmatch             
dra_tagain          
   dra_propdel   
          ra_tx                       nd_radio_transmitter          	   l   >          
   Traffic Sink   
       
   wban_sink_process   
          	processor                       �   �          
   Battery   
       
   wban_battery_process   
          	processor                   Current Draw   ���   
            count    ���   
   ����   
      list   	���   
            Receive Mode   ���   
@8������   TelosB   
      Transmission Mode   ���   
@1ffffff   TelosB (0 dBm)   
      	Idle Mode   ���   
@:�����   TelosB   
      
Sleep Mode   ���   
@ffffff   TelosB   
   
   
       ?   �   >          
   Traffic Source_UP   
       
   wban_packet_source_up_process   
          	processor                   Destination ID    ���   
����   HUB_ID   
      "User Priority 0 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 1 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 2 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 3 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 4 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            	MSDU Size   ���   
   constant (960)   
      
Start Time   ���   
��         Infinity   
   
   	      "User Priority 5 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            
Start Time   ���   
?�z�G�{����   
   
   	      "User Priority 6 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            	MSDU Size   ���   
   constant (960)   
      
Start Time   ���   
��         Infinity   
   
   	      "User Priority 7 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            
Start Time   ���   
��         Infinity   
   
   	          	            �   �   �  R   
       
   STRM_FROM_MAC_TO_RADIO   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream                     S  R   �   �   
       
   STRM_FROM_RADIO_TO_MAC   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream                     �  I   �   �          
   tx_busy_stat   
       
   channel [0]   
       
   radio transmitter.busy   
       
   
instat [0]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire                    V  J   �   �          
   rx_busy_stat   
       
   channel [0]   
       
   radio receiver.busy   
       
   
instat [1]   
          ����                  ����             ����          
   ����   
           ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire                    Z  F   �   �          
   collision_rx   
       
   channel [0]   
       
   radio receiver.collision status   
       
   
instat [2]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����          
@�� ����   
                                        nd_statistic_wire          !      	      �   �   s   D   
       
   STRM_FROM_MAC_TO_SINK   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          A   ?         �   C   �   �   
       
   STRM_FROM_UP_TO_MAC   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream      @   D       	                  
   shape_0   
       
    ����   
          ����             0����          
@g�     ����   
       
@P      ����   
       
@n      ����   
       
@Q�     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_0   
       
      APPLICATION LAYER   
          ����          
   ����   
           ����          
@j      ����   
       
@C�     ����   
       
@_�     ����   
       
@1      ����   
          
annot_text             Annotation Palette          
E�sX����   
       ����          
@�������   
               ����              ����           ����                 
   text_1   
       
      UP   TRAFFIC   
          ����          
    ����   
           ����          
@l      ����   
       
@_@     ����   
       
@C      ����   
       
@5      ����   
          
annot_text             Annotation Palette          
E�s�����   
       ����          
@�������   
               ����              ����           ����                 
   text_3   
       
      PHYSICAL LAYER   
          ����          
   ����   
           ����          
@o     ����   
       
@s�     ����   
       
@Z�     ����   
       
@*      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����                  
   shape_2   
       
    ����   
          ����             0����          
@n�     ����   
       
@u     ����   
       
@r�     ����   
       
@Q      ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                  
   shape_3   
       
    ����   
          ����             0����          
@l0     ����   
       
@h�     ����   
       
@d�     ����   
       
@T@     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_4   
       
      	MAC LAYER   
          ����          
   ����   
           ����          
@g`     ����   
       
@h�     ����   
       
@P�     ����   
       
@*      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����                  
   shape_4   
       
    ����   
          ����             0����          
@z�     ����   
       
@i     ����   
       
@Z�     ����   
       
@T@     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_5   
       
      BATTERY MODULE   
          ����          
   ����   
           ����          
@z�     ����   
       
@e�     ����   
       
@Z�     ����   
       
@9      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����                