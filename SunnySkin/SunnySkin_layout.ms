rollout SunnySkin "SunnySkin" width:165 height:300
(
	GroupBox grp_SkinandEffect "Skin and Bone" pos:[6,4] width:152 height:47
	checkbutton SkinReady "Ready to Skin" pos:[14,21] width:106 height:24
	spinner BoneEffectNum "" pos:[120,24] width:32 height:16 enabled:true range:[1,20,3] type:#integer scale:1 toolTip:"Bone Effect" 

	groupBox grp_EnandWeight "Envelope and Weight" pos:[6,60] width:152 height:177
	checkButton EditEnvelopes "Envelopes" pos:[15,80] width:62 height:55
		--($.modifiers[#Skin].bone_Limit = BoneEffectNum.value) 

	on SkinReady changed state do
	(
		if state == on  then 
		(	
			if selection.count ==  0 then 
			(
				messagebox "No selection" 
				SkinReady.state = off
			)
			else
			(
				SkinCheck = $.modifiers[#skin]
				if (SkinCheck != undefined) 
				then
				(
					messagebox "Already have Skin"
					SkinReady.state = off
				)
				else			
				SkinReady.text = "Ready??"
					
			)	
		)
		
		else 
		(
			modPanel.addModToSelection (Skin ()) ui:on
			$.modifiers[#Skin].bone_Limit = BoneEffectNum.value
			SkinReady.text = "Ready to Skin"
		)
	)
	
	on EditEnvelopes changed state do 
		if state == on then (subobjectLevel = 1)
		else subobjectLevel = 0
)

createDialog SunnySkin