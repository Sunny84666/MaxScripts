macroScript SunnySel category:"SunnyTool" tooltip:"Smart select filter" icon:#("Systems", 2)
(
	inifile = (sysInfo.currentdir + "\slog2.ini")
	btnArray = execute (GetINISetting inifile "btnDefault" "btn")

	rollout SunnySelect "SunnySelect" width:135 height:145
	(
		dropdownList ddl1 "Select Filter" pos:[21,7] width:90 height:41 
		items:(for f = 1 to 10 collect (GetSelectFilterName f)) --���filter���W��
		button btnA1 "All" pos:[10,54] width:93 height:25
		button btnA2 "" 	 pos:[103,54] width:21 height:25 tooltip:"chose your filter"
		button btnB1 "All" pos:[10,82] width:93 height:25
		button btnB2 "" 	 pos:[103,82] width:21 height:25 tooltip:"chose your filter"
		button btnC1 "All" pos:[10,110] width:93 height:25
		button btnC2 "" 	 pos:[103,110] width:21 height:25 tooltip:"chose your filter"
		
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
				btnA1.text = btnArray [1]		 --���J�W�����
				btnB1.text = btnArray [2]
				btnC1.text = btnArray [3]
			)	
		)	
		on ddl1 selected itm  do ddl1_select itm    --�W����򥻥\��
		on SunnySelect close do 
		(  
			btnArray [1] = btnA1.text	
			btnArray [2] = btnB1.text
			btnArray [3] = btnC1.text
			setINISetting inifile "btnDefault" "btn" (btnArray as String)  
				
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
		
		on btnA2 pressed do 
		(	
			mainPos = GetDialogPos SunnySelect  --���o�D�e����m
			createDialog ChangeSelectA pos:[ mainPos.x + 137 , mainPos.y]  --���H�D�e������m
		)	
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
		on btnB2 pressed do 
		(
			mainPos = GetDialogPos SunnySelect
			createDialog ChangeSelectB pos:[ mainPos.x + 137 , mainPos.y] 
		)	
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
		on btnC2 pressed do 
		(
			mainPos = GetDialogPos SunnySelect
			createDialog ChangeSelectC pos:[ mainPos.x + 137 , mainPos.y] 
		)		
			
		on btnC1 pressed do
		(	
			for f = 1 to 10 do
			(if btnC1.text ==   (GetSelectFilterName f)   
			do ddl1_select	(ddl1.selection = f))
			
		)
	)

	createDialog SunnySelect 

)


   
