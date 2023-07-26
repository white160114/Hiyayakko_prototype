import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map> getAllInRef() async {
  Map inRef = {};
  final db = FirebaseFirestore.instance.collection("Refrigerators").doc("43257463-7157-4b66-8f4a-e65ad7bf94d5").collection("in");
  final things = db.get();
  await things.then(
    (QuerySnapshot snapshot) {
      //FirebaseからとってきたデータをMap型に成形
      for(int i = 0; i < snapshot.size; i++){
        var getThing = snapshot.docs[i];
        Map thing = {};
        thing['name'] = getThing.get("name");
        thing['categoryName'] = getThing.get("categoryName");
        thing['imageName'] = getThing.get("imageName");
        thing['amount'] = getThing.get("amount");
        // DateTime date = getThing.get("limitDay").toDate();
        // date.year.toString() + "/" + date.month.toString() + "/" + date.day.toString();
        thing['limitDay'] = getThing.get("limitDay");
        inRef[i] = thing;
      }

      // ちゃんとMap型でとれたのかを確認する
      inRef.forEach((key, value) {
        print("--------------------------------------");
        value.forEach((key, value) {
          print(key + ": " + value.toString());
        });
      });
    }
  );

  return inRef;
}