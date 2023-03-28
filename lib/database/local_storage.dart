import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../api/joke_model.dart';

class LocalStorage {
  static const String _boxName = "favourites";
  static const String _key = "list";

  void initialize() async {
    Hive.registerAdapter(JokeModelAdapter());
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    await Hive.openBox<List>(_boxName);
  }

  void close() {
    _getBox().close();
  }

  Box<List> _getBox() {
    return Hive.box<List>(_boxName);
  }

  void put(JokeModel joke) {
    final jokes = _getBox().get(_key, defaultValue: [])?.cast<JokeModel>();
    if (jokes != null) {
      jokes.add(joke);
      _getBox().put(_key, jokes);
    }
  }

  List<JokeModel>? get() {
    return _getBox().get(_key, defaultValue: [])?.cast<JokeModel>();
  }

  void printStorage() {
    final jokes = _getBox().get(_key, defaultValue: [])?.cast<JokeModel>();
    if (jokes != null) {
      for (var joke in jokes) {
        developer.log(joke.value);
      }
    }
  }
}
