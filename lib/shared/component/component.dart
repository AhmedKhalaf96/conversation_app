import 'package:conversaion/model/user_model.dart';
import 'package:conversaion/module/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget TextFeildCustom({
  required var controller,
  var suffix,
  String? lable,
  bool obscure=false,
  var type,
  String? hint,
})=>TextFormField(
    style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal,letterSpacing: 1,height: 2),
    cursorColor: Colors.blue[800],obscureText: obscure,controller: controller,keyboardType: type,
    decoration: InputDecoration(suffixIcon: suffix,suffixIconColor: Colors.blue[800],labelText: lable ,hintText:hint ,
        border:OutlineInputBorder(
          borderSide:BorderSide(width: 1,color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        )
    )
);

Widget custombutton({required String lable})=>Container(
  decoration: BoxDecoration(
    color: Colors.blue[800],
    borderRadius: BorderRadius.circular(10),
  ),
  height: 70,width: 380,
  child: Center(child: Text(lable,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,letterSpacing: 2))),
);

Widget itemchat(UserDataModel model,context)=>InkWell(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ChatScreen(usermodel: model)));
  },
  child:   Padding(

    padding: const EdgeInsets.all(10.0),

    child: Container(

      padding:EdgeInsets.only(right: 10.0),

      decoration: BoxDecoration(

        color: Colors.grey[200],

        borderRadius: BorderRadius.circular(35),

      ),

      child: Row(

        children: [

          CircleAvatar(

            child: Icon(Icons.person,color: Colors.blue[800],),

            backgroundColor: Colors.grey[100],

            radius: 35,

          ),

          SizedBox(width: 15,),

          Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text('${model.name}',style: TextStyle(

                  color: Colors.black,fontSize: 19,

                  fontWeight: FontWeight.bold

              ),),

              Text(' Hi Ahmed ',style: TextStyle(

                  color: Colors.blue[800],fontSize: 15,

                  fontWeight: FontWeight.w600

              ),),



            ],

          ),

          Spacer(),

          Padding(

            padding: const EdgeInsets.only(right: 25),

            child: Column(

              children: [

                CircleAvatar(

                  radius: 12,

                  backgroundColor: Colors.blue[900],

                  child: Text(' 1 ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                ),

                SizedBox(height: 10,),

                Text('8.22',style: TextStyle(color: Colors.grey[800]),)

              ],

            ),

          )

        ],

      ),

    ),

  ),
);

