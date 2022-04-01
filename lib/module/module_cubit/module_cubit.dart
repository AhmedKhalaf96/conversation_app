import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversaion/model/user_model.dart';
import 'package:conversaion/module/module_cubit/module_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ModulesCubit extends Cubit<ModulesStates> {
  ModulesCubit() : super(ModulesInitialState());
  static ModulesCubit get(context) => BlocProvider.of(context);
  void userRigester({required String name,required String email,required String password,required String phone}){
    emit(UserRegisterLoad());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      Createuser(uid: value.user!.uid,phone: phone,email: email,name: name);
      emit(UserRegisterSuccess());
    }).catchError((error){
      emit(UserRegisterError(error));
    });
  }

  void userLogin({required String email,required String password}){
    emit(UserLoginLoad());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(UserLoginSuccess(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(UserLoginError(error));
    });
  }

  void Createuser({required String name,required String email,required String uid,required String phone}) {
    UserDataModel model=UserDataModel(
      name:name,
      email:email,
      phone:phone,
      uid:uid,
    );
    FirebaseFirestore.instance.collection('users').doc(uid).set(model.tomap()).then((value){
      emit(UserCreatedSuccess(uid));
    }).catchError((error) {
      print(error.toString());
      emit(UserCreatedError(error));
    });
  }

}