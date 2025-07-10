class_name  Character

extends Actor

var current_interactable : Interactable;

var model: CharacterModel:
	get:return model;

func _ready():
	model = CharacterModel.new();
	await model.init_async();
	var interaction_area : Area2D = get_node("Area2D");
	interaction_area.area_entered.connect(on_area_entered);

func _process(delta):
	if model:
		var direction = Vector2.ZERO;
		if Input.is_action_pressed("move_right"):
			direction.x = 1;
		if Input.is_action_pressed("move_left"):
			direction.x = -1;
		if Input.is_action_pressed("interact"):
			interact();

		position += direction * model.speed * delta;

func on_area_entered(area : Area2D) -> void:
	if area.get_parent() is Interactable:
		var interactable : Interactable = area.get_parent();
		interactable.show_notification();
		current_interactable = interactable;

func interact()-> void:
	if current_interactable:
		current_interactable.interact(self);

func free() -> void:
	model.free();
	super();