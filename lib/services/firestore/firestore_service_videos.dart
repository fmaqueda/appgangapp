import 'dart:developer';

import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/services/firestore/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseVideos {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // ignore: prefer_final_fields
  static String _collection = "videos";

  static final FirestoreService _firestoreService =
      FirestoreService(_collection);

  String generateUID() {
    return _firestoreService.generateId();
  }

  Stream<List<VideoModel>> videosStream() {
    return _firebaseFirestore
        .collection(_collection)
        .snapshots()
        .map((QuerySnapshot query) {
      List<VideoModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(VideoModel.fromJson(element.data() as Map<String, dynamic>));
      }
      print(retVal);
      return retVal;
    });
  }

  Future<bool> saveNewVideo(VideoModel video) async {
    try {
      //product.uid = _firestoreService.generateId();
      await _firebaseFirestore.collection(_collection).doc(video.id).set({
        "id": video.id,
        "name": video.name,
        "subtitle": video.subtitle,
        "urlImage": video.urlImage,
        "urlVid": video.urlVid
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      log("$e");
      return false;
    }
  }
}
