
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> createUser({required BuildContext context, required String? email, required String? password, required String? checkPassword}) async {
  if(checkPassword != password){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("エラー"),
            content: Text("パスワードを正しく入力してください"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("OK")
              ),
            ],
          );
        }
    );
  } else {
    if (email != null && password != null) {
      try {
        //ユーザーを作成
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final User user = userCredential.user!;
        FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
          'Name': null,
          'Gender': null,
          'Age': null,
          'Icon': null,
          'RefrigeratorID': null,
        });

        return user;

      } on FirebaseAuthException catch(e) { //この中エラー処理
        if(e.code == 'weak-password'){
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("エラー"),
                  content: Text("パスワードが短すぎます。"),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("OK")
                    ),
                  ],
                );
              }
          );
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("エラー"),
                  content: Text("入力されたメールアドレスは既に登録されています。"),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("OK")
                    ),
                  ],
                );
              }
          );
        }
      } catch(e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("エラー"),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("OK")
                  ),
                ],
              );
            }
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("エラー"),
              content: Text("入力してください"),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")
                ),
              ],
            );
          }
      );
    }
  }
  return null;
}