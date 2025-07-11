class_name GameService

extends Node
signal game_over;

var data : GameData;
var timer : Timer;
var is_game_ended : bool = false;

func _init() -> void:
	is_ready = false;
	if !instance:
		instance = self;

func _ready():
	data = GameData.new();
	data.init_data();
	is_ready = true;

	timer = Timer.new();
	add_child(timer);
	timer.timeout.connect(on_timeout);
	timer.start(data.initial_timer.value);
	for node in get_children():
		if node is NPC:
			var npc = node as NPC;
			npc.package_submitted.connect(on_package_submitted);

func on_package_submitted() -> void:
	data.submitted_package += 1;
	if data.submitted_package == data.package_pool.size():
		game_end();
	pass;
	
func _process(delta):
	if is_game_ended : return;
	data.initial_timer.set_value(timer.time_left);

func on_timeout() -> void:
	game_end();

func game_end() -> void:
	var score = (int)((timer.time_left * 100) + (data.submitted_package * 1000));
	data.player_score.set_value(score);
	is_game_ended = true;
	game_over.emit();

func close_game():
	var scene : PackedScene = load("res://mainmenu/nodes/main_menu.tscn");
	get_tree().change_scene_to_packed(scene);

func wait_service():
	if is_ready : pass;
	var timeout = get_tree().create_timer(5.0);
	while (not (is_ready)) && timeout.time_left > 0:
		await get_tree().process_frame

static var instance : GameService;
static var is_ready : bool = false;
