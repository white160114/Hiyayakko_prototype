import 'package:flutter/cupertino.dart';

class NewAccountCreateData extends ChangeNotifier{
  String? email;
  String? password;
  String? checkPassword;
  String? name;
  String? gender;
  String? age;

  void setEmail (String newEmail){
    email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPassword){
    password = newPassword;
    notifyListeners();
  }

  void setCheckPassword(String newCheckPassword){
    checkPassword = newCheckPassword;
    notifyListeners();
  }

  void setName(String newName){
    name = newName;
    notifyListeners();
  }

  void setGender(String newGender){
    gender = newGender;
    notifyListeners();
  }

  void setAage(String newAge){
    age = newAge;
    notifyListeners();
  }

  void printAll(){
    print("email:" + email! + "\npassword:" + password! + "\ncheckPassword" + checkPassword!);
    if(name != null && gender != null && age != null){
      print("\nname:" + name! + "\ngender:" + gender! + "\nage" + age!);
    }
  }
}