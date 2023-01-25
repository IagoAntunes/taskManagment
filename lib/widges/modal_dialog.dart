import 'package:flutter/material.dart';
import 'package:taskcontrol/database/database.dart';
import 'package:taskcontrol/models/task.dart';
import 'package:taskcontrol/store/home.store.dart';
import 'package:taskcontrol/utils/const.dart';

import '../utils/colors.dart';

class ModalDialog extends StatefulWidget {
  const ModalDialog({
    super.key,
    required this.store,
  });
  final HomeStore store;

  @override
  State<ModalDialog> createState() => _ModalDialogState();
}

class _ModalDialogState extends State<ModalDialog> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  String title = "";
  String description = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.40,
        decoration: BoxDecoration(
          color: isThemeDark ? primaryDarkColor : primaryLightColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  child: Text(
                    "Tarefa",
                    style: TextStyle(
                        fontSize: 28,
                        color: isThemeDark ? Colors.white : Colors.black),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color:
                        isThemeDark ? secondaryDardColor : secondaryLightColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: isThemeDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () async {
                      if (controllerTitle.text.isNotEmpty &&
                          controllerDescription.text.isNotEmpty) {
                        Task task = Task(
                          name: controllerTitle.text,
                          description: controllerDescription.text,
                          check: false,
                          status: TypeStatus.edit,
                        );
                        await LocalDatabase.insertTask(task);
                        widget.store.addTask(task);
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                color: isThemeDark ? secondaryDardColor : secondaryLightColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(width: 0.5, color: Colors.white),
              ),
              child: Focus(
                child: TextField(
                  controller: controllerTitle,
                  style: TextStyle(
                      color: isThemeDark ? Colors.white38 : Colors.grey),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    hintText: 'Titulo',
                    hintStyle: TextStyle(
                        color: isThemeDark ? Colors.white38 : Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isThemeDark ? secondaryDardColor : secondaryLightColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                    width: 0.5,
                    color: isThemeDark ? Colors.white : Colors.black),
              ),
              child: TextField(
                controller: controllerDescription,
                maxLines: 3,
                style: TextStyle(
                    color: isThemeDark ? Colors.white38 : Colors.grey),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: 'Descrição da Atividade...',
                  hintStyle: TextStyle(
                      color: isThemeDark ? Colors.white38 : Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
