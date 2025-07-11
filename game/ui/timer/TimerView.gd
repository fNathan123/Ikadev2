class_name TimerView

extends Label

var presenter : TimerPresenter

func _ready():
	presenter = TimerPresenter.new();
	await presenter.init_async(self);

func refresh() -> void:
	text = presenter.get_time_value();

func free() -> void:
	presenter.free();
	super();
