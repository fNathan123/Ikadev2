class_name PackageModel

var type : PackageType :
	get:return type;

func init_async():
	if !GameService.is_ready :
		await GameService.instance.wait_service();
	
	var pool = GameService.instance.data.package_pool;
	var randValue = randi_range(0,pool.size());
	type = PackageType.new().init(randValue);
