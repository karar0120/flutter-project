import 'package:recpie/modal/shopApp/login_modal.dart';

abstract class RIGShopStatas{}

class RIGShopinitialState extends RIGShopStatas{}


class RIGShoploadingState extends RIGShopStatas{}

class RIGShopEnterState extends RIGShopStatas{
  final Shoplogin loginmodal;

  RIGShopEnterState(this.loginmodal);
}


class RIGShopErorrState extends RIGShopStatas{
  final String Error;
  RIGShopErorrState(this.Error);
}
class RIGShoppasswordState extends RIGShopStatas{}