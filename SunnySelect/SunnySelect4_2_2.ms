--macroScript SunnySel category:"SunnyTool" tooltip:"Smart select filter" icon:#("Systems", 2)
(
	inifile = (sysInfo.currentdir + "\slog.ini")
	btnMain1default = GetINISetting inifile "btnDefault" "btnA"
	btnMain2default = GetINISetting inifile "btnDefault" "btnB"
	btnMain3default = GetINISetting inifile "btnDefault" "btnC"

	rollout SunnySelect "SunnySelect" width:135 height:145
	(
		dropdownList ddl_SelectFilter "Select Filter" pos:[21,7] width:90 height:41 
		items:(for f = 1 to 10 collect (GetSelectFilterName f)) --抓到filter的名稱
		button btnMain1 "All" pos:[10,54] width:93 height:25
		button btnPick1 "" 	 pos:[103,54] width:21 height:25 tooltip:"chose your filter"
		button btnMain2 "All" pos:[10,82] width:93 height:25
		button btnPick2 "" 	 pos:[103,82] width:21 height:25 tooltip:"chose your filter"
		button btnMain3 "All" pos:[10,110] width:93 height:25
		button btnPick3 "" 	 pos:[103,110] width:21 height:25 tooltip:"chose your filter"
		
		fn ddl_SelectFilter_select itm = (SetSelectFilter ddl_SelectFilter.selection)  --把下拉式選單做成功能，別的地方使用功能就能對應回到選單上
		on SunnySelect open do 
		(
			SetselectFilter 1
			if (getfiles inifile).count == 0  then			--如果INI檔不存在，就預設是ALL
			(
				btnMain1.text = "All"
				btnMain2.text = "All"
				btnMain3.text = "All"
			)	
			else 
			(
				btnMain1.text = btnMain1default			 --載入上次選取
				btnMain2.text = btnMain2default
				btnMain3.text = btnMain3default
			)	
		)	
		on ddl_SelectFilter selected itm  do ddl_SelectFilter_select itm    --上方選單基本功能
		on SunnySelect close do 
		(  
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnA" btnMain1.text   
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnB" btnMain2.text
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnC" btnMain3.text	
		) --記憶熱鍵設定存到INI中
	
		rollout ChangeSelect1 "pick one" width:144 height:153    --自己選取filter的視窗
		(
			listBox lbx1 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))  --抓到filter的名稱
			
			on lbx1 doubleClicked sel do
			(
				for f = 1 to 10 do
				(
					if lbx1.selection == f  do btnMain1.text = (GetSelectFilterName f))
					destroyDialog ChangeSelect1
				)
			)
		
		on btnPick1 pressed do 
		(	
			mainPos = GetDialogPos SunnySelect  --取得主畫面位置
			createDialog ChangeSelect1 pos:[ mainPos.x + 137 , mainPos.y]  --跟隨主畫面的位置
		)	
		on btnMain1 pressed do   --用自訂按扭來改變下拉式選單的filter
		(	
			for f = 1 to 10 do
			(if  btnMain1.text ==   (GetSelectFilterName f)   
			 do ddl_SelectFilter_select	    (ddl_SelectFilter.selection = f))
			
		)
		
		rollout ChangeSelect2 "pick one" width:144 height:153
		(
			listBox lbx2 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))
			
			on lbx2 doubleClicked sel do
			(
				for f = 1 to 10 do
			    (
					if lbx2.selection == f  do btnMain2.text = (GetSelectFilterName f))
				    destroyDialog ChangeSelect2			
			     )
		)
		on btnPick2 pressed do 
		(
			mainPos = GetDialogPos SunnySelect
			createDialog ChangeSelect2 pos:[ mainPos.x + 137 , mainPos.y] 
		)	
		on btnMain2 pressed do
		(	
			for f = 1 to 10 do
			(if btnMain2.text ==   (GetSelectFilterName f)   
			 do ddl_SelectFilter_select	   (ddl_SelectFilter.selection = f))
			
		)
		
		rollout ChangeSelect3 "pick one" width:144 height:153
		(
			listBox lbx3 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))
			
			on lbx3 doubleClicked sel do
			(
				for f = 1 to 10 do
			    (
					if lbx3.selection == f  do btnMain3.text = (GetSelectFilterName f))
			        destroyDialog ChangeSelect3			
			     )
		)
		on btnPick3 pressed do 
		(
			mainPos = GetDialogPos SunnySelect
			createDialog ChangeSelect3 pos:[ mainPos.x + 137 , mainPos.y] 
		)		
			
		on btnMain3 pressed do
		(	
			for f = 1 to 10 do
			(if btnMain3.text ==   (GetSelectFilterName f)   
			do ddl_SelectFilter_select	(ddl_SelectFilter.selection = f))
			
		)
	)

	createDialog SunnySelect 

)


   

