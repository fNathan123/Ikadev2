class_name  GameData

extends RefCounted

var initial_timer : IntegerValue;
var player_score : IntegerValue;
var character_speed : int;
var package_pool : Array[int];
var npc_ids : Array[int];
var submitted_package : int = 0;

func init_data() -> void:
	initial_timer = IntegerValue.new().init(60);
	player_score = IntegerValue.new().init(0);
	character_speed = 300;
	package_pool = [0,1,2,3];
	package_pool.shuffle();
	npc_ids = [0,1,2,3];

var last_npc_idx :int = 0;
func get_npc_id()->int:
	if last_npc_idx> npc_ids.size()-1:
		return -1;
	var res = npc_ids[last_npc_idx];
	last_npc_idx+=1;
	return res;
	
func get_npc_package(npc_id:int)->int:
	return package_pool[npc_id];

func save_high_score(new_score):
	if new_score <= load_high_score() : return;

	var file = FileAccess.open("user://highscore.dat", FileAccess.WRITE);
	if file:
		var d = { "high_score": new_score }
		file.store_string(JSON.stringify(d));
		file.close();
		print("highscore saved ", new_score);

func load_high_score() -> int:
	var file = FileAccess.open("user://highscore.dat", FileAccess.READ);
	if file:
		var content = file.get_as_text();
		file.close();
		if !content.is_empty():
			var data = JSON.parse_string(content);
			if data != null and data.has("high_score"):
				return int(data["high_score"]);
	return 0;
