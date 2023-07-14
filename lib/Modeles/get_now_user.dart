import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<String?> getNowUser() async {
  final uid = auth.currentUser?.uid.toString();
  print(uid.runtimeType);
  return uid;
}