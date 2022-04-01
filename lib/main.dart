import 'package:conversaion/layoute/chat_layoute.dart';
import 'package:conversaion/layoute/cubit/social_cubit.dart';
import 'package:conversaion/module/login.dart';
import 'package:conversaion/shared/cash_helper.dart';
import 'package:conversaion/shared/const.dart';
import 'package:conversaion/shared/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget widget;
  if(CashHelper.getData(key: 'uid')==null){
    uid='';
  }else{
    CashHelper.getData(key: 'uid');
  }
  if(uid!=''){
    widget=SocialLayoutScreen();
  }else{
    widget=LoginScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp( MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   final Widget startwidget;
   MyApp(this.startwidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SocialCubit()..getUsers())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startwidget,
      ),
    );
  }
}
