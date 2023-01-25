import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:taskcontrol/provider/home_provider.dart';
import 'package:taskcontrol/utils/const.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    required this.icon,
    required this.typeMenu,
  });

  final Color color;
  final IconData icon;
  final TypeStatus typeMenu;
  // final store = HomeStore();
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeProvider>(context).getHomeStore();
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          store.changeSelected(typeMenu);
        },
        child: Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: store.typeChoiced == typeMenu
                ? Border.all(width: 2, color: Colors.white)
                : null,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
