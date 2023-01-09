import 'package:party_seeker/models/base_view.dart';

abstract class ProfileView extends BaseView {
  @override
  navigateTo(String route, {bool removeUntil = false});

  void setDeleteEventLoading(bool value);
  void showMessage(String message);
}
