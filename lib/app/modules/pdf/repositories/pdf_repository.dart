import 'dart:typed_data';
import 'package:http/http.dart';

class PdfRepository {
  final Client client = new Client();
  Future<Uint8List> getImage(String photoUrl) async {
    try {
      var response = await client.get(photoUrl);
      return response.bodyBytes;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
