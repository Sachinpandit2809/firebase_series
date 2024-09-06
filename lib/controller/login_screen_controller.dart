import 'package:flutter/cupertino.dart';

class LoginScreenController with ChangeNotifier {
  bool _login = false;
  bool get loging => _login;
  void setLoging(bool load) {
    _login = load;
    notifyListeners();
  }

  bool _google = false;
  bool get google => _google;
  void setGoogle(bool load) {
    _google = load;
    notifyListeners();
  }

  bool _phone = false;
  bool get phone => _phone;
  void setPhone(bool load) {
    _phone = load;
    notifyListeners();
  }
}
