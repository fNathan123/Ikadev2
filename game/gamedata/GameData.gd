class_name  GameData

extends RefCounted

var initial_timer : IntegerValue;
var player_score : IntegerValue;
var character_speed : int;
var package_pool : Array[int]

func init_data() -> void:
    initial_timer = IntegerValue.new().init(60);
    player_score = IntegerValue.new().init(0);
    character_speed = 300;
    package_pool = [0,1,2,3]