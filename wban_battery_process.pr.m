MIL_3_Tfile_Hdr_ 145A 140A modeler 9 465AF638 540281D4 5B sjtu-058491abab billryan 0 0 none none 0 0 none 6CDBB154 573B 0 0 0 0 0 0 1bcc 1                                                                                                                                                                                                                                                                                                                                                                                      ��g�      @  �    �  G  O�  RG  RK  R�  SL  SX  U3  U7  O�      Power Supply   �������      Volts      @         2 AA Batteries (3V)              ����              ����         2 AA Batteries (3V)   @      ����         BThis attributes represent the power supply of the device (in Volt)�Z             Current Draw   �������   ����                   count    ���   
   ����   
      list   	���   
          
                                 bThis attributes represent the current draw of this device in different modes (RX, TX, IDLE, SLEEP)   count    �������    ����         ����         ����         ����           �Z             list   	�������   	����                                               Receive Mode   �������      mA      @;�33333   MICAz              ����              ����         MICAz   @;�33333����      TelosB   @8����������         `This attributes represent the current draw of the device in receive mode (in milli-Ampere (mA)).   "The default MICAz value is 27.7 mA   #The default TelosB value is 24.8 mA�Z             Transmission Mode   �������      mA      @1ffffff   MICAz (0 dBm)              ����              ����         MICAz (-10 dBm)   @&      ����      MICAz (-5 dBm)   @,      ����      MICAz (0 dBm)   @1ffffff����      TelosB (-10 dBm)   @&      ����      TelosB (-5 dBm)   @,      ����      TelosB (0 dBm)   @1ffffff����         eThis attributes represent the current draw of the device in transmission mode (in milli-Ampere (mA)).   &The default MICAz (TelosB) values are    - at -10 dBm = 11 mA   - at   -5 dBm = 14 mA   - at    0 dBm = 17.4 mA�Z             	Idle Mode   �������      mA      @A�        MICAz              ����              ����         MICAz   @A�     ����      TelosB   @:���������         ]This attributes represent the current draw of the device in idle mode (in micro-Ampere (mA)).    The default MICAz value is 35 mA   #The default TelosB value is 26.1 mA�Z             
Sleep Mode   �������      mA      @0         MICAz              ����              ����         MICAz   @0      ����      TelosB   @ffffff����         ^This attributes represent the current draw of the device in sleep mode (in micro-Ampere (�A)).    The default MICAz value is 16 �A   "The default TelosB value is 6.1 �A�Z          �Z          �Z             Initial Energy   �������      Joule      @��        2 AA Batteries (1.5V, 1600 mAh)      @Y      ����              ����         2 AA Batteries (1.5V, 2300 mAh)   @�B     ����      2 AA Batteries (1.5V, 1600 mAh)   @��     ����      2 AA Batteries (1.5V, 1200 mAh)   @�P     ����         ^This Attribute represent the intial amount of energy before any activity (in Joule = Watt*sec)       92 AA Batteries (1.5V, 2300 mAh) = 2*24 840 = 49 680 Joule   92 AA Batteries (1.5V, 1600 mAh) = 2*17�280 = 34 560 Joule   92 AA Batteries (1.5V, 1200 mAh) = 2*12 960 = 25 920 Joule�Z                 	   begsim intrpt         
   ����   
   doc file            	nd_module      endsim intrpt         
   ����   
   failure intrpts            disabled      intrpt interval         ԲI�%��}����      priority              ����      recovery intrpts            disabled      subqueue         
            count    ���   
   ����   
      list   	���   
          
   
   super priority             ����            begsim intrpt      begsim intrpt����   ����           ����          ����          ����                        !wban_battery_attributes	\battery;       $wban_battery_statistics	\statistics;       wban_node_activity	\activity;       ,wban_global_battery_statistics	\statisticsG;       ?/* if enabled, all the operation will be saved in a log file */   Boolean	\enable_log;       6/* a log file to store the operations for each node */   FILE*	\log;       /* log file name */   char	\log_name[250];       /* energy consuming */   $wban_energy_consume	\energy_consume;       int	\node_id;       int	\new_variable;       char	\node_name[20];           J   /* Include files					*/   #include "headers\wban_math.h"    #include "headers\wban_struct.h"    #include "headers\wban_params.h"   #include <stdlib.h>   #include <io.h>   #include <stdio.h>           &/* Codes for remote self interrupts	*/   #define PACKET_TX_CODE 101   #define PACKET_RX_CODE 102   $#define END_OF_SLEEP_PERIOD_CODE 103   #define CCA_CODE 107       H/* The same value should be in the wban_mac Module for remote process	*/   "#define END_OF_CAP_PERIOD_CODE 105   &#define START_OF_SLEEP_PERIOD_CODE 104   #define END_OF_SIM 106   	   ?/* if enabled, all the operation will be saved in a log file */   extern Boolean	enable_log;       /* Structures		*/   typedef struct {   	Objid own_id;   	Objid parent_id;   !	double power_supply; /*in Volt*/   $	double initial_energy; /*in Joule*/   	double current_rx_mA;   	double current_tx_mA;   	double current_idle_microA;   	double current_sleep_microA;       %	double current_energy; /*in Joule*/	   	   	char Device_Mode[20];   	Boolean enable;   	   } wban_battery_attributes;           typedef struct {   	Stathandle remaining_energy;   	Stathandle consumed_energy;   %	//Stathandle remaining_energy_ratio;   $	//Stathandle consumed_energy_ratio;   } wban_battery_statistics;           typedef struct {   	Stathandle consumed_energy;	   !} wban_global_battery_statistics;           typedef struct {   	Boolean is_idle;   	Boolean is_sleep;   	   	double last_idle_time;   	double sleeping_time;   } wban_node_activity;       typedef struct {   	double tx;   	double rx;   	double cca;   	double idle;   	double sleep;   } wban_energy_consume;       /* Function prototypes.				*/   %static void wban_battery_init (void);   'static void wban_battery_update (void);  1   R/*********************************************************************************   H * The battery module computes the consumed and remaining energy levels.   N * The default values of the current draws are set to those of the MICAz mote.   S**********************************************************************************/       R/*--------------------------------------------------------------------------------    * Function:	wban_battery_init    *   ( * Description:	- initialize the process   8 *				- read the attributes and set the global variables    *    * No parameters   T *--------------------------------------------------------------------------------*/   !static void wban_battery_init() {   	Objid current_draw_comp_id;    	Objid current_draw_id;   	int protocol_ver;   	char directory_path_name[200];   	char buffer[30];   	time_t rawtime;   	struct tm *p;        	/* Stack tracing enrty point */   	FIN(wban_battery_init);    	/* get the ID of this module */    	battery.own_id = op_id_self ();   	/* get the ID of the node */   5	battery.parent_id = op_topo_parent (battery.own_id);   	node_id = battery.parent_id;   	   D	/* get the value to check if this node is PAN Coordinator or not */   N	op_ima_obj_attr_get (battery.parent_id, "Device Mode", &battery.Device_Mode);   <	op_ima_obj_attr_get (battery.parent_id, "name", node_name);   T	op_ima_obj_attr_get (battery.parent_id, "Log File Directory", directory_path_name);       (	/* get the value of protocol version */   L	op_ima_obj_attr_get (battery.parent_id, "Protocol Version", &protocol_ver);   T	op_ima_obj_attr_get (battery.parent_id, "Log File Directory", directory_path_name);       C	/* verification if the directory_path_name is a valid directory */   O	if (prg_path_name_is_dir (directory_path_name) == PrgC_Path_Name_Is_Not_Dir) {   ]		op_sim_end("ERROR : Log File Directory is not valid directory name.","INVALID_DIR", "","");   	}       	time(&rawtime);   	p=localtime(&rawtime);   4    // strftime(buffer, 30, "%Y-%m-%d_%H-%M-%S", p);   .    strftime(buffer, 30, "%Y-%m-%d_%H-%M", p);   U    sprintf(log_name, "%s%s-ver%d.trace", directory_path_name, buffer, protocol_ver);           /* Check for existence */   *    // if((_access( log_name, 0 )) != -1){   0    //     printf("File %s exists\n", log_name);   #    // 	log = fopen(log_name, "a");       // } else {   0    // 	printf("File %s unexists.\n", log_name);   #    // 	log = fopen(log_name, "w");       // }       M	op_ima_obj_attr_get (battery.own_id, "Power Supply", &battery.power_supply);   Q	op_ima_obj_attr_get (battery.own_id, "Initial Energy", &battery.initial_energy);   I	op_ima_obj_attr_get (battery.own_id, "Current Draw", &current_draw_id);	   P	current_draw_comp_id = op_topo_child (current_draw_id, OPC_OBJTYPE_GENERIC, 0);   	   T	op_ima_obj_attr_get (current_draw_comp_id, "Receive Mode", &battery.current_rx_mA);   Y	op_ima_obj_attr_get (current_draw_comp_id, "Transmission Mode", &battery.current_tx_mA);   W	op_ima_obj_attr_get (current_draw_comp_id, "Idle Mode", &battery.current_idle_microA);   Y	op_ima_obj_attr_get (current_draw_comp_id, "Sleep Mode", &battery.current_sleep_microA);   	   1	battery.current_energy = battery.initial_energy;   	   D	/* register the statistics that will be maintained by this model */   x	// statistics.remaining_energy	= op_stat_reg ("Battery.Remaining Energy (Joule)", OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);   v	// statistics.consumed_energy	= op_stat_reg ("Battery.Consumed Energy (Joule)", OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);   x	// statisticsG.consumed_energy	= op_stat_reg ("Battery.Consumed Energy (Joule)", OPC_STAT_INDEX_NONE, OPC_STAT_GLOBAL);   	   F	// op_stat_write(statistics.remaining_energy,battery.current_energy);   2	// op_stat_write(statistics.consumed_energy,0.0);       3	// op_stat_write(statisticsG.consumed_energy,0.0);   	   	activity.is_idle = OPC_TRUE;   	activity.is_sleep = OPC_FALSE;   	activity.last_idle_time = 0.0;   	activity.sleeping_time = 0.0;       '	/* initilization for energy consume */   	energy_consume.tx = 0;   	energy_consume.rx = 0;   	energy_consume.cca = 0;   	energy_consume.idle = 0;   	energy_consume.sleep = 0;   	/* Stack tracing exit point */   	FOUT;   }       R/*--------------------------------------------------------------------------------     * Function:	wban_battery_update    *   C * Description:	compute the energy consumed and update enregy level   h *---------> consumed energy (JOULE) = current * time * voltage  = (AMPERE * SEC * VOLT) <--------------    *    * No parameters   T *--------------------------------------------------------------------------------*/   #static void wban_battery_update() {   	Ici * iciptr;   	double tx_time;   	double rx_time;   	int ppdu_bits;   	int mac_state;   	double consumed_energy;   	double tx_energy;   	double rx_energy;   	double cca_energy;   	double idle_energy;   	double sleep_energy;   	double idle_duration;   	double sleep_duration;   	Boolean is_BANhub;   	    	/* Stack tracing enrty point */   	FIN(wban_battery_update);       8	/* get the value to check if this node is Hub or not */   	is_BANhub = OPC_FALSE;   /	if (strcmp(battery.Device_Mode, "Hub") == 0) {   		is_BANhub = OPC_TRUE;   	}       -	if (op_intrpt_type() == OPC_INTRPT_REMOTE) {   		switch (op_intrpt_code()) {   			case PACKET_TX_CODE :   D				/* get the ICI information associated to the remote interrupt */   				iciptr = op_intrpt_ici();   5				op_ici_attr_get(iciptr, "PPDU BITS", &ppdu_bits);   5				op_ici_attr_get(iciptr, "MAC STATE", &mac_state);   .				op_ici_attr_get(iciptr, "TIME", &tx_time);   				op_ici_destroy(iciptr);   @				/* compute the consumed energy when transmitting a packet */   Q				tx_energy = (battery.current_tx_mA * MILLI) * tx_time * battery.power_supply;   '				/* node can rx while tx at OPNET */   Q				rx_energy = (battery.current_rx_mA * MILLI) * tx_time * battery.power_supply;   :				/* compute the time spent by the node in idle state */   B				idle_duration = op_sim_time()-tx_time-activity.last_idle_time;   �				printf("t=%f,NODE_NAME=%s,PACKET_TX_CODE,tx_time=%f,activity.last_idle_time=%f\n", op_sim_time(),node_name,tx_time,activity.last_idle_time);   				if(idle_duration < 0){   					idle_duration = 0;   				}   _				idle_energy = (battery.current_idle_microA * MICRO) * idle_duration * battery.power_supply;   #				energy_consume.tx += tx_energy;   #				energy_consume.rx -= rx_energy;   '				energy_consume.idle += idle_energy;   B				/* update the consumed energy with the one of in idle state */   ,				consumed_energy= tx_energy +idle_energy;   )				/* update the current energy level */   F				battery.current_energy = battery.current_energy - consumed_energy;   				   �				/* update the time when the node enters the idle state. we add tx_time, because the remote process is generated at the time to start transmission */   ,				activity.last_idle_time = op_sim_time();   				/* update the statistics */   J				// op_stat_write(statistics.remaining_energy, battery.current_energy);   `				// op_stat_write(statistics.consumed_energy, battery.initial_energy-battery.current_energy);   C				// op_stat_write(statisticsG.consumed_energy, consumed_energy);   
				break;   			   			case PACKET_RX_CODE :   D				/* get the ICI information associated to the remote interrupt */   				iciptr=op_intrpt_ici();   5				op_ici_attr_get(iciptr, "PPDU BITS", &ppdu_bits);   5				op_ici_attr_get(iciptr, "MAC STATE", &mac_state);   .				op_ici_attr_get(iciptr, "TIME", &rx_time);   				op_ici_destroy(iciptr);       =				/* compute the consumed energy when receiving a packet */   Q				rx_energy = (battery.current_rx_mA * MILLI) * rx_time * battery.power_supply;   :				/* compute the time spent by the node in idle state */   0				if(op_sim_time() < activity.last_idle_time){   					idle_duration = 0;   
				}else{   C					idle_duration = op_sim_time()-rx_time-activity.last_idle_time;   				}   �				printf("t=%f,NODE_NAME=%s,PACKET_RX_CODE,rx_time=%f,activity.last_idle_time=%f\n", op_sim_time(),node_name,rx_time,activity.last_idle_time);   				if(idle_duration < 0){   					idle_duration = 0;   				}   2				// if(compare_doubles(idle_duration, 0) != 1){   				// 	idle_duration = 0;   				// }   _				idle_energy = (battery.current_idle_microA * MICRO) * idle_duration * battery.power_supply;   #				energy_consume.rx += rx_energy;   '				energy_consume.idle += idle_energy;   B				/* update the consumed energy with the one of in idle state */   -				consumed_energy= rx_energy + idle_energy;   )				/* update the current energy level */   F				battery.current_energy = battery.current_energy - consumed_energy;   =				/* update the time when the node enters the idle state */   ,				activity.last_idle_time = op_sim_time();   <				/* the sleep time shoulde be at least at current time */   G				// if(compare_doubles(activity.sleeping_time, op_sim_time()) != 1){   /				// 	activity.sleeping_time = op_sim_time();   				// }   				   				/* update the statistics */   J				// op_stat_write(statistics.remaining_energy, battery.current_energy);   `				// op_stat_write(statistics.consumed_energy, battery.initial_energy-battery.current_energy);   C				// op_stat_write(statisticsG.consumed_energy, consumed_energy);   
				break;       			case CCA_CODE :   D				/* get the ICI information associated to the remote interrupt */   				iciptr=op_intrpt_ici();   5				op_ici_attr_get(iciptr, "MAC STATE", &mac_state);   				op_ici_destroy(iciptr);   :				idle_duration = op_sim_time()-activity.last_idle_time;   w				printf("t=%f,NODE_NAME=%s,CCA_CODE,activity.last_idle_time=%f\n", op_sim_time(),node_name,activity.last_idle_time);   				if(idle_duration < 0){   					idle_duration = 0;   				}   :				/* compute the time spent by the node in idle state */   2				// if(compare_doubles(idle_duration, 0) != 1){   				// 	idle_duration = 0;   				// }   _				idle_energy = (battery.current_idle_microA * MICRO) * idle_duration * battery.power_supply;   				// if(is_BANhub){   ]				// 	idle_energy = (battery.current_tx_mA * MILLI) * idle_duration * battery.power_supply;   				// }   =				/* compute the consumed energy when receiving a packet */   S				cca_energy = (battery.current_rx_mA * MILLI) * pCCATime * battery.power_supply;   %				energy_consume.cca += cca_energy;   '				energy_consume.idle += idle_energy;   B				/* update the consumed energy with the one of in idle state */   -				consumed_energy= cca_energy +idle_energy;   F				battery.current_energy = battery.current_energy - consumed_energy;   �				/* update the time when the node enters the idle state. we add pCCATime, because the remote process is generated at the time to start transmission */   H				/* do not update idle_time in CCA for breaking idle time while RX */   8				// activity.last_idle_time = op_sim_time()+pCCATime;   				/* update the statistics */   J				// op_stat_write(statistics.remaining_energy, battery.current_energy);   `				// op_stat_write(statistics.consumed_energy, battery.initial_energy-battery.current_energy);   C				// op_stat_write(statisticsG.consumed_energy, consumed_energy);   
				break;       $			case START_OF_SLEEP_PERIOD_CODE :   D				/* get the ICI information associated to the remote interrupt */   				iciptr=op_intrpt_ici();   5				op_ici_attr_get(iciptr, "MAC STATE", &mac_state);   				op_ici_destroy(iciptr);   :				/* compute the time spent by the node in idle state */   :				idle_duration = op_sim_time()-activity.last_idle_time;   �				printf("t=%f,NODE_NAME=%s,START_OF_SLEEP_PERIOD_CODE,activity.last_idle_time=%f\n", op_sim_time(),node_name,activity.last_idle_time);   				if(idle_duration < 0){   					idle_duration = 0;   				}   !				if(idle_duration > 0.000070){   C					/* update the consumed energy with the one of in idle state */   _					idle_energy= (battery.current_idle_microA * MICRO) * idle_duration * battery.power_supply;   (					energy_consume.idle += idle_energy;   *					/* update the current energy level */   C					battery.current_energy = battery.current_energy - idle_energy;   K					// op_stat_write(statistics.remaining_energy, battery.current_energy);   a					// op_stat_write(statistics.consumed_energy, battery.initial_energy-battery.current_energy);   @					// op_stat_write(statisticsG.consumed_energy, idle_energy);   				}   +				activity.sleeping_time = op_sim_time();   !				activity.is_idle = OPC_FALSE;   !				activity.is_sleep = OPC_TRUE;   
				break;       "			case END_OF_SLEEP_PERIOD_CODE :   D				/* get the ICI information associated to the remote interrupt */   				iciptr=op_intrpt_ici();   5				op_ici_attr_get(iciptr, "MAC STATE", &mac_state);   				op_ici_destroy(iciptr);   ;				/* compute the time spent by the node in sleep state */   :				sleep_duration = op_sim_time()-activity.sleeping_time;   "				if(sleep_duration > 0.000070){   /					/* energy consumed during sleeping mode */   c					sleep_energy = (battery.current_sleep_microA * MICRO) * sleep_duration * battery.power_supply;   *					energy_consume.sleep += sleep_energy;   *					/* update the current energy level */   D					battery.current_energy = battery.current_energy - sleep_energy;   K					// op_stat_write(statistics.remaining_energy, battery.current_energy);   a					// op_stat_write(statistics.consumed_energy, battery.initial_energy-battery.current_energy);   A					// op_stat_write(statisticsG.consumed_energy, sleep_energy);   				}       ,				activity.last_idle_time = op_sim_time();    				activity.is_idle = OPC_TRUE;   "				activity.is_sleep = OPC_FALSE;   
				break;   			   			default : break;   	    }   3	} else if (op_intrpt_type() == OPC_INTRPT_ENDSIM){   		log = fopen(log_name, "a");   _		fprintf(log, "t=%f,NODE_NAME=%s,NODE_ID=%d,STAT,ENERGY,", op_sim_time(), node_name, node_id);   E		fprintf(log, "TX=%f,RX=%f,", energy_consume.tx, energy_consume.rx);   K		fprintf(log, "CCA=%f,IDLE=%f,", energy_consume.cca, energy_consume.idle);   3		fprintf(log, "SLEEP=%f\n", energy_consume.sleep);   �		fprintf(log, "t=%f,NODE_NAME=%s,NODE_ID=%d,STAT,ENERGY,TOTAL=%f\n", op_sim_time(), node_name, node_id, battery.initial_energy - battery.current_energy);   		fclose(log);   	}   	/* Stack tracing exit point */   	FOUT;   }                                   	     Z          
   dissipation   
       
      wban_battery_update();   
       
          
           ����             pr_state         Z   Z          
   init   
       
      wban_battery_init();       
                     
   ����   
          pr_state                	   	  T   a        X  e   -  a   �     `          
   transit   
       
   default   
       
����   
       
    ����   
       
   ����   
                 
   pr_transition   
         	   �   Y      s   Y      Y          
   tr_12   
       ����          ����          
@����   
          ����                       pr_transition                   Remaining Energy (Joule)           Battery   normal   linear        ԲI�%��}   Consumed Energy (Joule)           Battery   normal   linear        ԲI�%��}      Consumed Energy (Joule)           Battery   normal   discrete        ԲI�%��}                  General Process Description:    ----------------------------    FThe sink process model accepts packets from any number of sources and    4discards them regardless of their content or format.       ICI Interfaces:    --------------    None        Packet Formats:    ---------------    None        Statistic Wires:    ----------------    None        Process Registry:    -----------------    Not Applicable       Restrictions:    -------------    None        