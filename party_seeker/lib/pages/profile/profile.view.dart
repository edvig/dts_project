import 'package:party_seeker/models/base_view.dart';
import 'package:party_seeker/models/event.dart';

abstract class ProfileView extends BaseView {
  @override
  navigateTo(String route, {bool removeUntil = false});

  void setDeleteEventLoading(bool value);
  void showMessage(String message);
  void setUserEventList(List<Event> events);
}
