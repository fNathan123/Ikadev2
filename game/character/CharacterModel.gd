class_name CharacterModel
extends RefCounted

var speed : int = 0 :
	get:return speed

var controllable : bool :
	get: return !GameService.instance.is_game_ended;

func init_async():
	if !GameService.is_ready:
		await GameService.instance.wait_service();

	speed = GameService.instance.data.character_speed;
