--function that will print out selected object names:
fn GetSelBone =
(
	for s in selection do ($.modifiers[#Skin].bone_Limit = BoneEffectNum)
)--end fn
 
--add the callback that executes the function:
callbacks.addScript #selectionSetChanged "GetSelBone()" id:#myCallbackID
 
--see if your callback has been registered:
callbacks.show()
 
--remove your callback by ID:
callbacks.removeScripts #selectionSetChanged id:#myCallbackID