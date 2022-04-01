import 'package:conversaion/layoute/chat_layoute.dart';
import 'package:conversaion/module/module_cubit/module_cubit.dart';
import 'package:conversaion/module/module_cubit/module_state.dart';
import 'package:conversaion/shared/cash_helper.dart';
import 'package:conversaion/shared/component/component.dart';
import 'package:conversaion/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
   var namecontroller=TextEditingController();
   var emailcontroller=TextEditingController();
   var passwordcontroller=TextEditingController();
   var phonecontroller=TextEditingController();


   @override
  Widget build(BuildContext context) {
     return BlocProvider(
         create: (BuildContext context)=>ModulesCubit(),
         child: BlocConsumer<ModulesCubit,ModulesStates>(
         listener: (context,state){
       if(state is UserCreatedSuccess){
         CashHelper.saveData(key: 'uid', value: state.UId).then((value){
           uid=state.UId;
           Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) =>  SocialLayoutScreen())
           );
         });
       }
     },
     builder: (context,state){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create New Account',style: TextStyle(color: Colors.blue[800],fontSize: 30,fontWeight: FontWeight.normal),),
                SizedBox(height: 40,),
                TextFeildCustom(
                    controller: namecontroller,
                    lable: 'Name',
                  type: TextInputType.text,
                  suffix: Icon(Icons.text_fields)
                ),
                SizedBox(height: 20,),
                TextFeildCustom(
                    controller: emailcontroller,
                    lable: 'Email Address',
                    type: TextInputType.emailAddress,
                    suffix: Icon(Icons.email_outlined)
                ),
                SizedBox(height: 20,),
                TextFeildCustom(
                    controller: passwordcontroller,
                    lable: 'Password',
                    type: TextInputType.text,
                    suffix: Icon(Icons.password_outlined)
                ),
                SizedBox(height: 20,),
                TextFeildCustom(
                    controller: phonecontroller,
                    lable: 'phone',
                    type: TextInputType.number,
                    suffix: Icon(Icons.phone)
                ),
                SizedBox(height: 50,),
                Center(child: InkWell(
                    onTap: (){
                      ModulesCubit.get(context).userRigester(name:namecontroller.text ,
                        email: emailcontroller.text,
                        password:passwordcontroller.text,
                        phone:phonecontroller.text,
                      );
                    },
                    child: custombutton(lable: 'Signup'))),

              ],
            ),
          ),
        ),
      ),
    );
     }
         )
     );
   }
}