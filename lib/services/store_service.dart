import 'package:advert/models/info_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService {
 final db =  FirebaseFirestore.instance;
 Future<void> info_dataSave(InfoData infoData) async{
  await db.collection("products").add(infoData.toMap(),);
 }
}