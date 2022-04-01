import 'package:conversaion/layoute/cubit/social_cubit.dart';
import 'package:conversaion/layoute/cubit/social_state.dart';
import 'package:conversaion/shared/component/component.dart';
import 'package:conversaion/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayoutScreen extends StatelessWidget {
  const SocialLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.blue[800],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Center(child: Text('Conversaion',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.normal,letterSpacing: 2),)),
                  SizedBox(height: 15,),
                  Container(
                    width: double.maxFinite,
                    height: height(context)-106,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40,right: 80,top: 5),
                            child: Row(
                              children: [
                                Text('Chat',style: TextStyle(color: Colors.blue[800],fontSize: 21,fontWeight: FontWeight.w500,letterSpacing: 2),),
                                Spacer(),
                                Icon(Icons.search,color: Colors.blue[800],),
                                SizedBox(width: 15,),
                                Icon(Icons.add,color: Colors.blue[800],),

                              ],
                            ),

                          ),
                          SizedBox(height: 20,),
                          Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                                itemBuilder: (context,index)=>itemchat(SocialCubit.get(context).users[index],context),
                                separatorBuilder: (context,index)=>Divider(),
                                itemCount: SocialCubit.get(context).users.length),
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
