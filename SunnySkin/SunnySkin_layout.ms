rollout SunnySkin "SunnySkin" width:162 height:300
(
	groupBox grp_SkinandEffect "Skin and Bone" pos:[6,4] width:152 height:53
	checkButton SkinReady "Ready to Skin" pos:[20,23] width:106 height:24
	
	on SkinReady changed state do
	(
		if state == on  then 
		(	
			if $.modifiers == Skin()
			then print "are you sure??"

			else
			
			SkinReady.text = "Ready??"
		)
		
		else 
		(
		modPanel.addModToSelection (Skin ()) ui:on
		$.modifiers[#Skin].bone_Limit = 3
		SkinReady.text = "Ready to Skin"
		)

	$.modifiers	
		
	)	
		
)

createDialog SunnySkin