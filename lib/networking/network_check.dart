import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.mobile || connectivityResult.first == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
