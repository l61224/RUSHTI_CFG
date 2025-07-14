**Installation**

1. Download and put all rushti_cfg related objects from 'lib' folder to target instance data folder
2. Restart instance

**Usage**
1. Adjust './rushti-master/config.ini' to match your TM1 environment
2. Open cube: 'Sys RushTI Parameter' and maintain following information:
	a)	RushTI.py Path (e.g. D:/DBs/RushTI_Cfg/Script/rushti.py)
	b) 	Default Maximum RushTI Threads (depends on you total available CPU)
	c) 	RushTI Task Export Folder (e.g. D:/DBs/RushTI_Cfg/Export/RushTI)
	d) 	Default Instance Name (e.g. RushTI_Cfg)
3. Open cube: 'Sys RushTI Configuration' to start your first rushti_cfg
4. After configuration, Run TI: 'Sys.RushTI Configuration.Caller' to execute your first rushti_cfg
