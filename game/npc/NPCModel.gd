class_name NPCModel
extends RefCounted

var id : int :
	get: return id;

var package_id : int :
	get: return package_id;

func init_async():
	if(!GameService.is_ready):
		await GameService.instance.wait_service();
	id = GameService.instance.data.get_npc_id();
	package_id = GameService.instance.data.get_npc_package(id);
