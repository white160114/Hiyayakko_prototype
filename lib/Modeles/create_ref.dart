import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiyayakko/Modeles/get_now_user.dart';

void createRef(String refName, String refID) async {
  await FirebaseFirestore.instance.collection('Refrigerators').doc(refID).set({
    'refName': refName,
    'invitationCode': null,
    'invitationCodeLimit': null,
  });

  await getNowUser().then((uuid) {
    FirebaseFirestore.instance.collection('Refrigerators').doc(refID).collection('Users').doc(uuid).set({});
    FirebaseFirestore.instance.collection('Users').doc(uuid).update({'refrigeratorID': refID});
  });

}