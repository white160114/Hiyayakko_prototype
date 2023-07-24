
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getCategoryToFirestore() async {
  List docList = [];
  final category = FirebaseFirestore.instance.collection("Category");
  category.get().then(
    (QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach(
          (doc) {
            docList.add(doc.data());
        },
      ),
      // docList.forEach((element) {print(element['categoryName']);})
    },
  );
  return docList;
}