import 'package:conversaion/layoute/chat_layoute.dart';
import 'package:conversaion/layoute/cubit/social_cubit.dart';
import 'package:conversaion/layoute/cubit/social_state.dart';
import 'package:conversaion/model/message_model.dart';
import 'package:conversaion/model/user_model.dart';
import 'package:conversaion/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatScreen extends StatelessWidget {
  UserDataModel usermodel;
  var messageController=TextEditingController();
  ChatScreen({required this.usermodel});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          SocialCubit.get(context).getMessage(recieverID: usermodel.uid);
          return BlocConsumer<SocialCubit,SocialStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: Colors.blue[800],
                  appBar: AppBar(
                    titleSpacing: 5.0,
                    title: Row(
                      children: [
                        Text(usermodel.name,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        CircleAvatar(radius: 6,backgroundColor: Colors.green,),

                      ],
                    ),
                    backgroundColor: Colors.blue[800],
                    leading: InkWell(
                        onTap: (){
                          Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) =>  SocialLayoutScreen()));
                        },
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,)),shadowColor: Colors.grey[500],elevation: 0.0,
                    actions: [
                      Icon(Icons.call,color: Colors.white,),
                      SizedBox(width: 20,),
                      Icon(Icons.more_vert_rounded,color: Colors.white,),
                      SizedBox(width: 20,),

                    ],
                  ),
                  body:Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    height: height(context),
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index){
                                  if(SocialCubit.get(context).messages[index].senderId==uid){
                                    return mymessage(SocialCubit.get(context).messages[index]);
                                  }else{
                                    return recievermessage(SocialCubit.get(context).messages[index]);
                                  }
                                },
                                separatorBuilder: (context,index)=>Divider(),
                                itemCount: SocialCubit.get(context).messages.length),
                          ),
                          //Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      //border: Border.all(color: Colors.grey,width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextFormField(
                                      controller: messageController,
                                      decoration: InputDecoration(
                                          hintText: 'type message here ...',
                                          border:OutlineInputBorder(
                                            borderSide:BorderSide(width: 1,color: Colors.blue),
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      if(messageController.text.isNotEmpty){
                                        SocialCubit.get(context).sendMessage(recieverId: usermodel.uid, dateTime: DateTime.now().toString(), text: messageController.text);
                                        messageController.text='';
                                      }else{
                                        Fluttertoast.showToast(msg: 'No data to send',backgroundColor: Colors.red,textColor: Colors.white);
                                      }
                                    },
                                    child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey,width: 1),
                                          borderRadius: BorderRadius.circular(40),
                                        ) ,
                                        child: Center(child: Icon(Icons.send,color: Colors.blue[800],size: 35,))),
                                  ),
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              });

        });
  }
  Widget recievermessage(MessageModel model)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(15),
            topEnd: Radius.circular(15),
            topStart: Radius.circular(15),
          )
      ),
      child: Text('${model.message}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),
    ),
  );
  Widget mymessage(MessageModel model)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(15),
            topEnd: Radius.circular(15),
            topStart: Radius.circular(15),
          )
      ),
      child: Text('${model.message}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),
    ),
  );
}
