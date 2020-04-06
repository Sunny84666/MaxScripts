
global GetSelSkin    --一定要先宣告Callback function的類型,不然重開時會跳錯誤
	
rollout SunnySkin "SunnySkin" width:165 height:300
(
	GroupBox grp_SkinandEffect "Skin and Bone" pos:[6,4] width:152 height:47
	checkbutton SkinReady "Ready to Skin" pos:[14,21] width:106 height:24
	spinner BoneEffectNum "" pos:[120,24] width:32 height:16 enabled:true range:[1,20,3] type:#integer scale:1 toolTip:"Bone Effect" 
	groupBox grp_EnandWeight "Envelope and Weight" pos:[6,60] width:152 height:177
	checkButton EditEnvelopes "Envelopes" pos:[15,80] width:62 height:55 enabled:false		
	
	on SunnySkin open do  --自定CallBack 指令，判斷選取的目標身上有沒有帶skin
	(	
		fn GetSelSkin =					
		(
			for s in selection do 
			(
				SkinCheck = $.modifiers[#skin]
				if (SkinCheck != undefined)
				then 
				(
					EditEnvelopes.enabled = true   --把這些變數放裡面，才能跟按鈕的enabled做連動
					BoneEffectNum.value = $.modifiers[#Skin].bone_Limit
				)
				else EditEnvelopes.enabled = false
			)
			if selection.count == 0 do EditEnvelopes.enabled = false
		)
		callbacks.addScript #selectionSetChanged "GetSelSkin()" id:#SunnyCallbackID  --當選取物有改變時，則會動作
		callbacks.show() 
	)
	
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
			EditEnvelopes.enabled = true
		)
	)
	
-- 	on EditEnvelopes changed state do 
-- 		if state == on then (subobjectLevel = 1)
-- 		else subobjectLevel = 0
	
	on SunnySkin close do (callbacks.removeScripts #selectionSetChanged id:#SunnyCallbackID)  
	--關閉視窗就刪掉自訂義的callback
)

callbacks.removeScripts #selectionSetChanged id:#SunnyCallbackID
createDialog SunnySkin