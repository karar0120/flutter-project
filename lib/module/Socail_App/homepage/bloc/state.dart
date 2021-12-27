import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';

abstract class SocailAppState{}

class SocailAppStateinitialState extends SocailAppState{}

class lodingSocailAppState extends SocailAppState{}

class EnterUserSocailAppState extends SocailAppState{}

class ErrorUserSocailAppState extends SocailAppState{
  final String Error;
  ErrorUserSocailAppState(this.Error);
}


class lodingGetAlllSocailAppState extends SocailAppState{}

class EnterGetAlllUserSocailAppState extends SocailAppState{}

class ErrorGetAlllUserSocailAppState extends SocailAppState{
  final String Error;
  ErrorGetAlllUserSocailAppState(this.Error);
}




class ChangeButtonNavSocailAppState extends SocailAppState{}


class NewPostSocailAppState extends SocailAppState{}

class SocialProfileImagePickedSuccessState extends SocailAppState{}

class SocialProfileImagePickedErrorState extends SocailAppState{}


class SocialProfileCoverPickedSuccessState extends SocailAppState{}

class SocialProfileCoverPickedErrorState extends SocailAppState{}


class SocialUpdateProfileImageSuccessState extends SocailAppState{}

class SocialUpdateProfileImageErrorState extends SocailAppState{}


class SocialUpdateCoverSuccessState extends SocailAppState{}

class SocialUpdateCoverErrorState extends SocailAppState{}
class SocialUpdateuserErrorState extends SocailAppState{}


class SocialUpdateuserloadingState extends SocailAppState{}



class SocialPostcreateloadingState extends SocailAppState{}

class SocialPostcreateSuccessState extends SocailAppState{}

class SocialPostcreateErrorState extends SocailAppState{}



class SocialUpdatePostSuccessState extends SocailAppState{}

class SocialUpdatePostErrorState extends SocailAppState{}


class SocialRemoveImageSuccessState extends SocailAppState{}



class SocialGetPostloadingState extends SocailAppState{}

class SocialGetPostSuccessState extends SocailAppState{}

class SocialGetPostErrorState extends SocailAppState{
  final error;
  SocialGetPostErrorState(this.error);
}

class SocialLikeSuccessState extends SocailAppState{}

class SocialLikeErrorState extends SocailAppState{
  final error;
  SocialLikeErrorState(this.error);
}



class SocialCommentSuccessState extends SocailAppState{}

class SocialCommentErrorState extends SocailAppState{
  final error;
  SocialCommentErrorState(this.error);
}



class SocialSendMassageSuccessState extends SocailAppState{}

class SocialSendMassageErrorState extends SocailAppState{}


class SocialReciveMassageSuccessState extends SocailAppState{}

class SocialReciveMassageErrorState extends SocailAppState{}