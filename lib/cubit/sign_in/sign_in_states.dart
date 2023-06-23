// import '../../widget/model.dart';
import '../../models/sign_in_model.dart';

abstract class SignInStates {}

//Login
class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final SignInModel? loginModel;

  SignInSuccessState(this.loginModel);
}

class SignInErrorState extends SignInStates {
  final String error;

  SignInErrorState(this.error);
}

class ShowPassword extends SignInStates {}
