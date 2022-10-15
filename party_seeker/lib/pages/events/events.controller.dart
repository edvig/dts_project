import '../../config/global.controller.dart';
import 'events.view.dart';

class EventsController {
  final EventsView _view;
  GlobalController globalController = GlobalController();

  EventsController(this._view);
}
