<img width="460" height="330" alt="Hold_wo_BK" src="https://github.com/user-attachments/assets/deb6e321-a4c2-472c-8d2f-c57664f5d089" />

# Why use RUSHT_CFG?
RUSHTI_CFG is a TM1 model that centralizes and simplifies RushTI usage. It improves development, maintenance, and collaboration by managing all configurations within TM1 cubes.

✅ Key Benefits
* Faster Setup
> No need to manually create ```config.ini``` or ```task.txt```.
* Centralized Management
> All RushTI tasks are defined in one shared location.
* Easier Maintenance
> Quickly update TI references when logic changes.
* Team Visibility
> Developers can view and reuse existing RushTI setups.

# Installation

1. Download and put all rushti_cfg related objects from 'lib' folder to target instance data folder
2. Restart instance

# Configuration/ Testing
1. ✏️Open cube: 'Sys RushTI Parameter' and maintain following information:
>
	1)	RushTI.py Path 			(e.g. D:/DBs/RushTI_Cfg/Script/rushti.py)
	2)	RushTI Config.ini Path 		(e.g. D:/DBs/RushTI_Cfg/Script/config.ini)
   	3) 	Default Maximum RushTI Threads 	(Depends on you total available CPU)
	4) 	RushTI Task Export Folder 	(e.g. D:/DBs/RushTI_Cfg/Export/RushTI)
	5) 	Default Instance Name 		(e.g. RushTI_Cfg)
>
2. ✏️Open cube: 'Sys RushTI Instance Information' and maintain following information:
>
	1)	Instance Name:	(Required: Any Instnace Name your want/ Any name possible/ sensitive)
	2)	Admin Host:	(Required: Admin host in ./instance/cfg/tm1s.cfg)
	4)	HTTP Port:	(Required: HTTPPORTNumber in ./instance/cfg/tm1s.cfg)
	5)	CAM Namespace:	(Optional)
	6)	User:		(Required: Recommand to use 
	7)	Password:	(Required)
	8)	SSL: 		(Required)
	9)	Base64 Decode:	(Optional: Recommand to use base64 decode to avoid Special symbols in password)
>
3. ⚙️Run TI: 'Sys.RushTI Instance Information.Update' to update ./rushti-master/config.ini content
4. ⚙️Run TI: 'Sys.RushTI Configuration.Caller' to check rushti connection
>
>	pRushTIID = Z999
>
# Start your 1st rushti_cfg💪
1. ✏️Open cube: 'Sys RushTI Configuration' and maintain following information:
#### View: 1. RushTI Default Config
>
	1)	Mode:	NORM/ OPT	(Optional: Normal Mode/ Optimized Mode, If blank = NORM)
	2)	Max Threads: 		(Optional: If blank = Default Maximum RushTI Threads from cube: 'Sys RushTI Paramter')
	3) 	Retry Time:		(Optional: If blank = 0)
	4)	Result File Name	(Optional: If blank = rushti.csv)
>
#### View: 2.1 NORM - Process Setting - Configure your rushti processes list
>
	1) 	InstanceName:		(Optional: If blank = Default InstanceName from cube: 'Sys RushTI Paramter')
	2)	WAIT:			(If 1 = RushTI will wait until above process completed)
	3)	ProcessName:		(Required: process name from dim: }APQ Processes)
	4)	Comment:		(Optional: leave commet for your configuration)
>
#### View: 2.2 NORM - Process Param. Configuration - Configure your paramters by process
>	
	1) 	ParamType:
		Blank 	= Pass nothing, this will use TI default Value in prompt
		Value 	= Pass Fixed Value ( You can use <<pParam>> to replace when executing TI: 'Sys.RushTI Configuration.Caller')
		MDX	= Pass MDX ( RushTI will trigger this process per element in the MDX result set)
	2) 	ParamValue
		Blank 	= Pass blank
		Value 	= You can use <<pParam>> to replace when executing TI: 'Sys.RushTI Configuration.Caller'
		MDX	= You can use <<pMDX>> to replace part/ whole mdx when executing TI: 'Sys.RushTI Configuration.Caller' (Do NOT USE "=" in mdx)

>
2. ⚙️Run TI: 'Sys.RushTI Configuration.Caller' to start your 1st rushti_cfg
>
	1)  	pRushTIID: 	(Required: which you configured in cube: 'Sys RushTI Configuration')
 	2) 	pParaReplace: 	(Optional: split by comma, eg. <<pParam>>:10, <<pMDX>>:{[Year].[2025]+[Year].[2026]})
  	3) 	pWaitExeCmd: 	(Optional: If blank = 0 = DO NOT WAIT, HIGHLY recommended that set 'pWaitExeCmd' = 0 when USER trigger (to avoid deadlock))
   	4) 	pSleepTime: 	(Optional (If blank = DO NOT SLEEP/ 1 = 1 second, 'pSleepTime' to let the user wait a few seconds before RushTI call the task file)
>
