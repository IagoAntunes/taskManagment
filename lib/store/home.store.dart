import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taskcontrol/utils/const.dart';

import '../models/task.dart';
import '../utils/colors.dart';
import '../widges/menu_item.dart';

part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  List<Widget> menus = [
    FilterItem(
      color: greenColor,
      icon: Icons.check,
      typeMenu: TypeStatus.ok,
    ),
    FilterItem(
      color: secondaryDardColor,
      icon: Icons.edit,
      typeMenu: TypeStatus.edit,
    ),
    FilterItem(
      color: redColor,
      icon: Icons.close,
      typeMenu: TypeStatus.closed,
    ),
  ];

  @observable
  var isDark = false;

  @observable
  var listTask = ObservableList<Task>();

  @observable
  var listFilter = ObservableList<Task>();

  @observable
  TypeStatus typeChoiced = TypeStatus.edit;

  @action
  void changeSelected(TypeStatus type) {
    typeChoiced = type;
    listFilter = ObservableList<Task>();
    for (var element in listTask) {
      if (element.status == typeChoiced) {
        listFilter.add(element);
      }
    }
  }

  @action
  void addList(List<Task> list) {
    for (var element in list) {
      listTask.add(element);
    }
  }

  @action
  void changeListFilter(String filter) {
    listFilter = ObservableList<Task>();
    for (var element in listTask) {
      if ((element.name.contains(filter) ||
              element.description.contains(filter)) &&
          element.status == typeChoiced) {
        listFilter.add(element);
      }
    }
  }

  @action
  void addTask(Task task) {
    listTask.add(task);
  }

  @action
  void changeTheme() {
    isDark = !isDark;
  }
}
