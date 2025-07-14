**Installation**

1. Download and put all rushti_cfg related objects from 'lib' folder to target instance data folder
2. Restart instance

**Usage**
1. Adjust './rushti-master/config.ini' to match your TM1 environment
2. Open cube: 'Sys RushTI Parameter' and maintain following information:
	1)	RushTI.py Path 			(e.g. D:/DBs/RushTI_Cfg/Script/rushti.py)
	2)	RushTI Config.ini Path 		(e.g. D:/DBs/RushTI_Cfg/Script/config.ini)
   	3) 	Default Maximum RushTI Threads 	(Depends on you total available CPU)
	4) 	RushTI Task Export Folder 	(e.g. D:/DBs/RushTI_Cfg/Export/RushTI)
	5) 	Default Instance Name 		(e.g. RushTI_Cfg)
3. Open cube: 'Sys RushTI Instance Information' and maintain following information:
	1)	Instance Name:	(Required: Any Instnace Name your want/ Any name possible/ sensitive)
	2)	Admin Host:	(Required: Admin host in ./instance/cfg/tm1s.cfg)
	4)	HTTP Port:	(Required: HTTPPORTNumber in ./instance/cfg/tm1s.cfg)
	5)	CAM Namespace:	(Optional)
	6)	User:		(Required: Recommand to use 
	7)	Password:	(Required)
	8)	SSL: 		(Required)
	9)	Base64 Decode:	(Optional: Recommand to use base64 decode to avoid Special symbols in password)
5. Open cube: 'Sys RushTI Configuration' to start your first rushti_cfg
6. After configuration, Run TI: 'Sys.RushTI Configuration.Caller' to execute your first rushti_cfg
