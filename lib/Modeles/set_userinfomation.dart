import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiyayakko/Modeles/get_now_user.dart';

Future<void> SetUserInfomation ({required String name, required String? gender, required int? age}) async {
  var uid = await getNowUser().then((uid) => {
    FirebaseFirestore.instance.collection('Users').doc(uid).set({
    'userName': name,
    'gender': gender,
    'age': age,
    'icon': null,
    'refrigeratorID': null,
    })
  });

}