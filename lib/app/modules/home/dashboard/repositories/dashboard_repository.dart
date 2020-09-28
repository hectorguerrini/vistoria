import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardRepository {
  final CollectionReference _clienteCollection =
      FirebaseFirestore.instance.collection('clientes');
  final CollectionReference _imoveisCollection =
      FirebaseFirestore.instance.collection('imoveis');
  Stream<int> getNumberClientes() {
    return _clienteCollection.snapshots().map((event) {
      return event.docs.length;
    });
  }

  Stream<int> getNumberImoveis() {
    return _imoveisCollection.snapshots().map((event) {
      return event.docs.length;
    });
  }
}
