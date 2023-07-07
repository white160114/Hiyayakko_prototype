
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void setUserInfomation ({required User user, required String userName, required String gender, required String age}){
  //userNameなどが入力されていない場合のエラーメッセージがまだ未実装
  FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
    'Name': userName,
    'Gender': gender,
    'Age': age,
  });
}