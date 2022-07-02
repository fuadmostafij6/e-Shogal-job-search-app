import 'package:eshogal/login/loginwithemail.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';


class SpalashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.to(LoginWithEmail());
    });
  }
}
