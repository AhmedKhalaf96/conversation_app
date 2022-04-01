import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversaion/layoute/cubit/social_state.dart';
import 'package:conversaion/model/message_model.dart';
import 'package:conversaion/model/user_model.dart';
import 'package:conversaion/shared/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);

  List<UserDataModel> users=[];
  void getUsers()async{
    users=[];
    await FirebaseFirestore.instance
        .collection('users').get().then((value){
          value.docs.forEach((element) {
            if(element.data()['uid']!=uid)
            users.add(UserDataModel.fromJson(element.data()));
          });
          emit(getAllUserSuccessState());
    }).catchError((error){
      emit(getAllUserErrorState());

    });
  }

  void sendMessage({
    required String recieverId,
    required String dateTime,
    required String text,
  }){
    MessageModel messageModel=MessageModel(
        senderId: uid, recieverId: recieverId, dateTime: dateTime, message: text);
    //to my chat
    FirebaseFirestore.instance.collection('users').doc(uid).collection('chats').doc(recieverId)
        .collection('messages').add(messageModel.tomap()).then((value){
      emit(SendMessageSuccessState());
    }).catchError((error){
      emit(SendMessageErrorState());
    });
    // to other chat
    FirebaseFirestore.instance.collection('users').doc(recieverId).collection('chats').doc(uid)
        .collection('messages').add(messageModel.tomap()).then((value){
      emit(SendMessageSuccessState());
    }).catchError((error){
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages=[];
  void getMessage({required String recieverID})async{
    FirebaseFirestore.instance.collection('users').doc(uid).collection('chats').doc(recieverID).collection('messages')
        .orderBy('dateTime').snapshots().listen((event) {
      messages=[];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(GetMessageSuccess());
    });
  }
}