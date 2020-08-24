import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PdfRepository {
  final Dio dio = new Dio();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<Uint8List> getImage(String photoUrl) async {
    try {
      // StorageReference fileReference =
      //     await _firebaseStorage.getReferenceFromUrl(photoUrl);

      Response<List<int>> response = await dio.get(photoUrl,
          options: Options(responseType: ResponseType.bytes));
      return Uint8List.fromList(response.data);

      // return await fileReference.getData(1024 * 1024);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
