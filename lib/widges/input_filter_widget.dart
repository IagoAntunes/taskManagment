import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcontrol/provider/home_provider.dart';

import '../utils/colors.dart';

class InputFilter extends StatelessWidget {
  const InputFilter({super.key});

  @override
  Widget build(BuildContext context) {
    var store =
        Provider.of<HomeProvider>(context, listen: false).getHomeStore();
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        border: Border.all(color: isThemeDark ? Colors.white : Colors.black),
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextFormField(
        style: TextStyle(color: isThemeDark ? Colors.white60 : Colors.grey),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: InputBorder.none,
          hintText: 'Pesquise uma tarefa...',
          suffixIcon: Icon(
            Icons.search,
            color: isThemeDark ? Colors.white : Colors.black,
          ),
          hintStyle: TextStyle(
            color: isThemeDark ? Colors.grey.shade400 : Colors.grey,
            fontSize: 14,
          ),
        ),
        onChanged: ((value) {
          store.changeListFilter(value);
        }),
      ),
    );
  }
}
