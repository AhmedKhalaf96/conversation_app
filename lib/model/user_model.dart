class UserDataModel{
  late String name;
  late String email;
  late String phone;
  late String uid;

  UserDataModel({
   required this.name, required this.email, required this.phone,required this.uid
});
  UserDataModel.fromJson(Map<String,dynamic>json){
     name=json['name'];
     email=json['email'];
     phone=json['phone'];
     uid=json['uid'];
  }
  Map<String,dynamic>tomap(){
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,


    };
  }
}