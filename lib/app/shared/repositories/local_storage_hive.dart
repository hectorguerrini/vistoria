import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';

import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    openBox();
  }

  openBox() async {
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future<List> get(String key) async {
    var box = await _instance.future;
    if (!box.isOpen) {
      _instance = Completer<Box>();
      await openBox();
    }
    return box.get(key);
  }

  @override
  Future put(String key, List value) async {
    var box = await _instance.future;
    box.put(key, value);
  }

  @override
  Future reset() async {
    var box = await _instance.future;
    box.delete('clientes');
  }
}
