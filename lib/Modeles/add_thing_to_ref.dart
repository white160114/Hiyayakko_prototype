
import 'package:cloud_firestore/cloud_firestore.dart';

void addThingToRef(String? foodName, String? category,String? expiryDate,String? quantity,String? imagePath){
  FirebaseFirestore.instance.collection("Refrigerators").doc("43257463-7157-4b66-8f4a-e65ad7bf94d5").collection("in").add({
    "name": foodName,
    "categoryName": category,
    "amount": quantity,
    "limitDay": expiryDate,
    "imageName": imagePath,
  });
}