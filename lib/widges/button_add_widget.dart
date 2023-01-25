import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcontrol/provider/home_provider.dart';
import 'package:taskcontrol/widges/modal_dialog.dart';

import '../utils/colors.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({super.key});
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeProvider>(context).getHomeStore();
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => ModalDialog(store: store),
      ),
      backgroundColor: greenColor,
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
