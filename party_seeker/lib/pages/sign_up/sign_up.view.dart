import 'package:party_seeker/models/base_view.dart';
import 'package:party_seeker/models/user.dart';

abstract class SignUpView extends BaseView {
  bool isFormValid();
  User getUser();
}
