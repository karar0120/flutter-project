

abstract class RIGsocailStatas{}

class RIGsocailinitialState extends RIGsocailStatas{}


class RIGsocailloadingState extends RIGsocailStatas{}

class RIGsocailEnterState extends RIGsocailStatas{

}


class RIGsocailErorrState extends RIGsocailStatas{
  final String Error;
  RIGsocailErorrState(this.Error);
}
class RIGsocailpasswordState extends RIGsocailStatas{}


class RIGsocailCreateuserState extends RIGsocailStatas{

}


class RIGsocailErorusersState extends RIGsocailStatas{
  final String Error;
  RIGsocailErorusersState(this.Error);
}