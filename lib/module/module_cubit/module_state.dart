abstract class ModulesStates{}

class ModulesInitialState extends ModulesStates{}

class UserLoginLoad extends ModulesStates{}

class UserLoginSuccess extends ModulesStates{
  String UId;

  UserLoginSuccess(this.UId);
}


class UserLoginError extends ModulesStates{
  String error;

  UserLoginError(this.error);
}

class UserRegisterLoad extends ModulesStates{}

class UserRegisterSuccess extends ModulesStates{}

class UserRegisterError extends ModulesStates{
  String error;

  UserRegisterError(this.error);
}

class UserCreatedSuccess extends ModulesStates{
  String UId;

  UserCreatedSuccess(this.UId);
}

class UserCreatedError extends ModulesStates{
  String error;

  UserCreatedError(this.error);
}