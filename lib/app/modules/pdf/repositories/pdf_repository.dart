import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PdfRepository {
  final Client client = new Client();
  final Dio dio = new Dio();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<Uint8List> getImage(String photoUrl) async {
    try {
      // StorageReference fileReference =
      //     await _firebaseStorage.getReferenceFromUrl(photoUrl);
      var response = await client.get(photoUrl);
      return response.bodyBytes;

      // return await fileReference.getData(1024 * 1024);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
