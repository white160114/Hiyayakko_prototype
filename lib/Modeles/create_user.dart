import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> CreateUser ({required BuildContext context, required String? email, required String? password, required String? checkPassword, required String? name, required String? gender, required int? age}) async {
  if(password == checkPassword){
    print("パスワードがあっています");
    try {/// credential にはアカウント情報が記録される
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      FirebaseFirestore.instance.collection('Users').doc(credential.user?.uid).set({
        'userName': name,
        'gender': gender,
        'age': age,
        'icon': null,
        'refrigeratorID': null,
      });

    } on FirebaseAuthException catch (e) {/// アカウントに失敗した場合のエラー処理
      if (e.code == 'weak-password') {/// パスワードが弱い場合
        print('パスワードが弱いです');
      } else if (e.code == 'email-already-in-use') {/// メールアドレスが既に使用中の場合
        print('すでに使用されているメールアドレスです');
      } else { /// その他エラー
        print('アカウント作成エラー:' + e.toString());
      }
      Navigator.pop(context);
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
} else {
    print("パスワードが間違っています");
    Navigator.pop(context);
  }
}