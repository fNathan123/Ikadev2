class_name TruckModel

var package_id : Array[int] :
	get: return package_id;

func init_async() :
	if(!GameService.is_ready):
		await GameService.instance.wait_service();
	package_id = GameService.instance.data.package_pool;
	package_id.shuffle();

var last_package_idx = 0;
func get_package()->int:
	if last_package_idx >= package_id.size():
		return -1;
	var res = package_id[last_package_idx];
	last_package_idx += 1;
	return res;
