class_name GameOverPresenter

var view : GameOverView;
var model : GameOverModel :
    get:return model;

func init_async(_view : GameOverView):
    model = GameOverModel.new();
    await model.init_async();
    view = _view;
    view.refresh();
    model.game_over.connect(on_game_over);

func get_score() -> String:
    return str(model.score);

func on_game_over() -> void:
    view.visible = true;
    view.refresh();