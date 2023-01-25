// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$menusAtom = Atom(name: '_HomeStore.menus', context: context);

  @override
  List<Widget> get menus {
    _$menusAtom.reportRead();
    return super.menus;
  }

  @override
  set menus(List<Widget> value) {
    _$menusAtom.reportWrite(value, super.menus, () {
      super.menus = value;
    });
  }

  late final _$isDarkAtom = Atom(name: '_HomeStore.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$listTaskAtom =
      Atom(name: '_HomeStore.listTask', context: context);

  @override
  ObservableList<Task> get listTask {
    _$listTaskAtom.reportRead();
    return super.listTask;
  }

  @override
  set listTask(ObservableList<Task> value) {
    _$listTaskAtom.reportWrite(value, super.listTask, () {
      super.listTask = value;
    });
  }

  late final _$listFilterAtom =
      Atom(name: '_HomeStore.listFilter', context: context);

  @override
  ObservableList<Task> get listFilter {
    _$listFilterAtom.reportRead();
    return super.listFilter;
  }

  @override
  set listFilter(ObservableList<Task> value) {
    _$listFilterAtom.reportWrite(value, super.listFilter, () {
      super.listFilter = value;
    });
  }

  late final _$typeChoicedAtom =
      Atom(name: '_HomeStore.typeChoiced', context: context);

  @override
  TypeStatus get typeChoiced {
    _$typeChoicedAtom.reportRead();
    return super.typeChoiced;
  }

  @override
  set typeChoiced(TypeStatus value) {
    _$typeChoicedAtom.reportWrite(value, super.typeChoiced, () {
      super.typeChoiced = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void changeSelected(TypeStatus type) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeSelected');
    try {
      return super.changeSelected(type);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addList(List<Task> list) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addList');
    try {
      return super.addList(list);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeListFilter(String filter) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeListFilter');
    try {
      return super.changeListFilter(filter);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(Task task) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menus: ${menus},
isDark: ${isDark},
listTask: ${listTask},
listFilter: ${listFilter},
typeChoiced: ${typeChoiced}
    ''';
  }
}
