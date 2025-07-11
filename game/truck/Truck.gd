class_name Truck

extends Interactable

var model : TruckModel : 
    get:return model;

@export var view : TruckView;

func _ready():
    model = TruckModel.new();
    await model.init_async();

func interact(_actor : Actor) -> void:
    _actor.set_owned_package(model.get_package());

func show_notification() -> void:
    view.show_baloon();

func hide_notification() -> void:
    view.hide_baloon();