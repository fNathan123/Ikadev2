class_name GameService

extends Node

var data : GameData;
var timer : Timer;

func _init() -> void:
	instance = self;

func _ready():
	instance = self;
	data = GameData.new();
	data.init_data();
	is_ready = true;

	timer = Timer.new();
	add_child(timer);
	timer.timeout.connect(on_timeout);
	timer.start(data.initial_timer.value);

func _process(delta):
	data.initial_timer.set_value(timer.time_left);

func on_timeout() -> void:
	print("timeout");

func wait_service():
	if is_ready : pass;
	var timeout = get_tree().create_timer(5.0);
	while (not (is_ready)) && timeout.time_left > 0:
		await get_tree().process_frame

static var instance : GameService;
static var is_ready : bool = false;
