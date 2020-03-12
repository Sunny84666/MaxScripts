macroScript SunnySel category:"SunnyTool" tooltip:"Smart select filter" icon:#("Systems", 2)
(
	btnA1default = GetINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnA"
	btnB1default = GetINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnB"
	btnC1default = GetINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnC"

	rollout SunnySelect "SunnySelect" width:135 height:145
	(
		dropdownList ddl1 "Select Filter" pos:[21,7] width:90 height:41 
		items:(for f = 1 to 10 collect (GetSelectFilterName f)) --���filter���W��
		button btnA1 "All" pos:[10,54] width:93 height:25
		button btnA2 "" pos:[103,54] width:21 height:25 tooltip:"chose your filter"
		button btnB1 "All" pos:[10,82] width:93 height:25
		button btnB2 "" pos:[103,82] width:21 height:25 tooltip:"chose your filter"
		button btnC1 "All" pos:[10,110] width:93 height:25
		button btnC2 "" pos:[103,110] width:21 height:25 tooltip:"chose your filter"
		
		fn ddl1_select itm = (SetSelectFilter ddl1.selection)  --��U�Ԧ���氵���\��A�O���a��ϥΥ\��N������^����W
		on SunnySelect open do 
		(
			SetselectFilter 1
			if btnA1default == "" then			--�p�GINI�ɤ��s�b�A�N�w�]�OALL
			(
				btnA1.text = "All"
				btnB1.text = "All"
				btnC1.text = "All"
			)	
			else 
			(
				btnA1.text = btnA1default			 --���J�W�����
				btnB1.text = btnB1default
				btnC1.text = btnC1default
			)	
		)	
				
		on ddl1 selected itm  do ddl1_select itm    --�W����򥻥\��
		on SunnySelect close do 
		(  
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnA" btnA1.text   
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnB" btnB1.text
			setINISetting (sysInfo.currentdir + "\slog.ini") "btnDefault" "btnC" btnC1.text	
		) --�O�м���]�w�s��INI��
		
		rollout ChangeSelectA "pick one" width:144 height:153    --�ۤv���filter������
		(
			listBox lbx1 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))  --���filter���W��
			
			on lbx1 doubleClicked sel do
			(
				for f = 1 to 10 do
				(
					if lbx1.selection == f  do btnA1.text = (GetSelectFilterName f))
					destroyDialog ChangeSelectA
				)
			)
		on btnA2 pressed do createDialog ChangeSelectA  
			
		on btnA1 pressed do   --�Φۭq����ӧ��ܤU�Ԧ���檺filter
		(	
			for f = 1 to 10 do
			(if  btnA1.text ==   (GetSelectFilterName f)   
			 do ddl1_select	    (ddl1.selection = f))
			
		)
		
		rollout ChangeSelectB "pick one" width:144 height:153
		(
			listBox lbx2 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))
			
			on lbx2 doubleClicked sel do
			(
				for f = 1 to 10 do
			    (
					if lbx2.selection == f  do btnB1.text = (GetSelectFilterName f))
				    destroyDialog ChangeSelectB			
			     )
		)
		on btnB2 pressed do createDialog ChangeSelectB 
			
		on btnB1 pressed do
		(	
			for f = 1 to 10 do
			(if btnB1.text ==   (GetSelectFilterName f)   
			 do ddl1_select	   (ddl1.selection = f))
			
		)
		
		rollout ChangeSelectC "pick one" width:144 height:153
		(
			listBox lbx3 "Select filter" pos:[8,8] width:127 height:8
			items:(for f = 1 to 10 collect (GetSelectFilterName f))
			
			on lbx3 doubleClicked sel do
			(
				for f = 1 to 10 do
			    (
					if lbx3.selection == f  do btnC1.text = (GetSelectFilterName f))
			        destroyDialog ChangeSelectC			
			     )
		)
			on btnC2 pressed do createDialog ChangeSelectC 
			
		on btnC1 pressed do
		(	
			for f = 1 to 10 do
			(if btnC1.text ==   (GetSelectFilterName f)   
			do ddl1_select	(ddl1.selection = f))
			
		)
	)

	createDialog SunnySelect

)


   
