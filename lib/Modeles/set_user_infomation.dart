
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Modeles/get_now_user.dart';

Future<void> setUserInfomation({required String name, String? gender, int? age}) async {
  String? uid = await getNowUser() as String?;
  await FirebaseFirestore.instance.collection('Users').doc(uid).update({
  'userName': name,
  'gender': gender,
  'age': age,
  });
}