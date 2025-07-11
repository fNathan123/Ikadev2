class_name  TimerModel
extends RefCounted

var timer : ObservableValue:
	get:return timer;

func init_async(_tree : SceneTree):
	if !GameService.is_ready:
		await GameService.instance.wait_service();
	timer = GameService.instance.data.initial_timer;
