class_name CharacterModel

var speed : int = 0 :
    get:return speed

func init_async():
    if !GameService.is_ready:
        await GameService.instance.wait_service();

    speed = GameService.instance.data.character_speed;