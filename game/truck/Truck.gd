class_name Truck

extends Interactable

var model : TruckModel : 
    get:return model;

@export var view : TruckView;

func _ready():
    model = TruckModel.new();
    await model.init_async();

func interact(_actor : Actor) -> bool:
    if _actor.owned_package >= 0:
        return false;
    _actor.set_owned_package(model.get_package());
    return true;

func show_notification() -> void:
    view.show_baloon();

func hide_notification() -> void:
    view.hide_baloon();

func free() -> void:
    model.free();
    super();