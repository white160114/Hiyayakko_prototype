import 'package:flutter/cupertino.dart';

class AccountData extends ChangeNotifier{
  String? name;
  String? gender;
  String? age;

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
    if(name != null && gender != null && age != null){
      print("\nname:" + name! + "\ngender:" + gender! + "\nage" + age!);
    }
  }
}