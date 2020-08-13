import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class NovaVistoriaRepository {
  final ILocalStorage _storage;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final CollectionReference _vistoriasCollection =
      Firestore.instance.collection('vistorias');
  NovaVistoriaRepository(this._storage);

  Future<DocumentReference> saveVistoria(VistoriaModel vistoriaModel) async {
    if (vistoriaModel.reference != null) {
      await vistoriaModel.reference.updateData(vistoriaModel.toJson());

      return vistoriaModel.reference;
    } else {
      return await _vistoriasCollection.add(vistoriaModel.toJson());
    }
  }

  Future<String> uploadImages(File image, String uidVenda, String ambiente,
      String item, int index) async {
    try {
      StorageReference reference = _firebaseStorage
          .ref()
          .child("images/$uidVenda/$ambiente/$item/foto$index.jpeg");

      //Upload the file to firebase
      StorageUploadTask uploadTask = reference.putFile(image);

      // Waits till the file is uploaded then stores the download url
      String location =
          await (await uploadTask.onComplete).ref.getDownloadURL();

      //returns the download url
      return location;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> deleteImage(String photoUrl) async {
    try {
      StorageReference fileReference =
          await _firebaseStorage.getReferenceFromUrl(photoUrl);
      await fileReference.delete();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
