class_name TimerPresenter
extends RefCounted

var view : TimerView;
var model : TimerModel;

func init_async(_view : TimerView):
	view = _view;
	model = TimerModel.new();
	await model.init_async(_view.get_tree());
	model.timer.value_changed.connect(on_timer_changed);
	view.refresh();

func get_time_value() -> String :
	return model.timer._to_string();

func on_timer_changed() -> void:
	view.refresh();

func free() -> void:
	model.free();
	super();
