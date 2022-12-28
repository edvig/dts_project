import 'package:party_seeker/models/base_view.dart';
import 'package:party_seeker/models/event.dart';

abstract class AddEventView implements BaseView {
  bool isFormValid();
  Event getNewEvent();
}
