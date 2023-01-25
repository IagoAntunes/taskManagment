import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcontrol/provider/home_provider.dart';

class RowMenus extends StatelessWidget {
  const RowMenus({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeProvider>(context).getHomeStore();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: store.menus,
      ),
    );
  }
}
