/*
* File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedErrorState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }


*
*
*
*
*
*
* */