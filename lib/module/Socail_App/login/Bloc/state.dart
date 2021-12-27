
abstract class SocailStatas{}

class SocailinitialState extends SocailStatas{}


class SocailloadingState extends SocailStatas{}

class SocailEnterState extends SocailStatas{
  final String uid;
  SocailEnterState(this.uid);
}


class SocailErorrState extends SocailStatas{

  final String Error;
  SocailErorrState(this.Error);

}
class SocailpasswordState extends SocailStatas{}