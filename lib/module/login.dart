import 'package:conversaion/layoute/chat_layoute.dart';
import 'package:conversaion/module/module_cubit/module_cubit.dart';
import 'package:conversaion/module/module_cubit/module_state.dart';
import 'package:conversaion/module/signup.dart';
import 'package:conversaion/shared/cash_helper.dart';
import 'package:conversaion/shared/component/component.dart';
import 'package:conversaion/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   var emailcontroller=TextEditingController();
   var passwordcontroller=TextEditingController();

   @override
  Widget build(BuildContext context) {
     return BlocProvider(
         create: (BuildContext context)=>ModulesCubit(),
         child: BlocConsumer<ModulesCubit,ModulesStates>(
         listener: (context,state){
       if(state is UserLoginSuccess){
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: double.maxFinite,height: 200,
                  child: Image.asset('images/back.png',fit: BoxFit.fill,)),
              SizedBox(height: 5,),
              Center(
                child: Container(
                    width: 90,height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0

                      )]
                    ),
                    child: Image.asset('images/icon.png',)),
              ),
              Text('Conversaion',style: TextStyle(color: Colors.blue[800],letterSpacing: 2,fontSize: 50)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFeildCustom(
                  controller: emailcontroller,
                  lable: 'enter mail',
                  type: TextInputType.emailAddress,
                  suffix: Icon(Icons.person),
                  obscure: false,
                  hint: "example@gmail.com"
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFeildCustom(
                    controller: passwordcontroller,
                    lable: 'password',
                    type: TextInputType.text,
                    suffix: Icon(Icons.lock_outline_sharp),
                    obscure: true,
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                    onTap: (){
                      ModulesCubit.get(context).userLogin(email: emailcontroller.text,
                          password: passwordcontroller.text);
                  },
                  child: custombutton(lable: 'Login')),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have accout ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignupScreen()));
                      },
                      child: Text('Signup now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue[800]),))

                ],
              )

            ],
          ),
        ),
      ),
    );
     }
         )
     );
   }
}
