import 'package:recpie/modal/shopApp/login_modal.dart';
import 'package:recpie/module/shopApp/loginScreen/ShopLogin.dart';

abstract class ShopStatas{}

class ShopinitialState extends ShopStatas{}


class ShoploadingState extends ShopStatas{}

class ShopEnterState extends ShopStatas{
  final Shoplogin loginmodal;

  ShopEnterState(this.loginmodal);
}


class ShopErorrState extends ShopStatas{
  final String Error;
  ShopErorrState(this.Error);
}
class ShoppasswordState extends ShopStatas{}