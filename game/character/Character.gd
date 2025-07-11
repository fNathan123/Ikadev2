class_name  Character

extends Actor

var current_interactable : Interactable;

var model: CharacterModel:
	get:return model;

@export var view : CharacterView;

func _ready():
	model = CharacterModel.new();
	await model.init_async();
	var interaction_area : Area2D = get_node("Area2D");
	interaction_area.area_entered.connect(on_area_entered);
	interaction_area.area_exited.connect(on_area_exited);

func _process(delta):
	if model:
		if !model.controllable : 
			velocity=Vector2.ZERO;
			view.play_idle();
			return;

		var direction = Vector2.ZERO;
		if Input.is_action_pressed("move_right"):
			direction.x = 1;
		elif Input.is_action_pressed("move_left"):
			direction.x = -1;
		if Input.is_action_just_pressed("interact"):
			interact();
		
		if direction.length() > 0 :
			view.play_walk(direction);
		else :
			view.play_idle();
		velocity = direction * model.speed;

func _physics_process(delta: float) -> void:
	move_and_slide();

func on_area_entered(area : Area2D) -> void:
	if area.get_parent() is Interactable:
		var interactable : Interactable = area.get_parent();
		interactable.show_notification();
		current_interactable = interactable;

func on_area_exited(area : Area2D) -> void:
	if area.get_parent() is Interactable:
		var interactable : Interactable = area.get_parent();
		interactable.hide_notification();
		if current_interactable == interactable:
			current_interactable = null;

func interact()-> void:
	if current_interactable:
		if current_interactable.interact(self):
			view.play_drop_package();

func set_owned_package(_package : int) -> void:
	owned_package = _package;
	if _package >=0 :
		view.set_package(_package);
	else :
		view.hide_package();