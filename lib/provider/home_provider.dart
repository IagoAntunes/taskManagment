import 'package:flutter/material.dart';
import 'package:taskcontrol/store/home.store.dart';

class HomeProvider extends ChangeNotifier {
  final HomeStore _home = HomeStore();

  HomeStore getHomeStore() {
    return _home;
  }
}
