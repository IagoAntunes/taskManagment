import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:taskcontrol/database/database.dart';
import 'package:taskcontrol/provider/home_provider.dart';
import 'package:taskcontrol/store/home.store.dart';
import 'package:taskcontrol/utils/colors.dart';
import 'package:taskcontrol/utils/const.dart';
import 'package:taskcontrol/widges/button_add_widget.dart';
import 'package:taskcontrol/widges/input_filter_widget.dart';
import 'package:taskcontrol/widges/row_menus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore? store;
  Future<bool> getData() async {
    if (store == null) {
      var list = await LocalDatabase.getTask();
      store = Provider.of<HomeProvider>(context, listen: false).getHomeStore();
      store!.addList(list);
      store!.changeSelected(TypeStatus.edit);
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isThemeDark ? primaryDarkColor : primaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isThemeDark = !isThemeDark;
              });
            },
            icon: Icon(
              isThemeDark ? Icons.dark_mode : Icons.light_mode,
              color: isThemeDark ? Colors.white : Colors.black,
            ),
          ),
        ],
        title: Text(
          'Tarefas',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 36, color: isThemeDark ? Colors.white : Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Center(child: InputFilter()),
                const SizedBox(height: 30),
                const RowMenus(),
                const SizedBox(height: 40),
                FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Observer(
                          builder: (context) {
                            return ListView.separated(
                              itemCount: store!.listFilter.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 15),
                              itemBuilder: (context, index) => Slidable(
                                enabled: store!.typeChoiced == TypeStatus.edit,
                                key: const ValueKey(0),
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  dismissible: DismissiblePane(onDismissed: () {
                                    store!.listFilter[index].status =
                                        TypeStatus.closed;
                                    store!.listFilter[index].check = true;

                                    store!.changeSelected(store!.typeChoiced);
                                  }),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        store!.listFilter[index].status =
                                            TypeStatus.closed;
                                        store!.listFilter[index].check = true;

                                        store!
                                            .changeSelected(store!.typeChoiced);
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Remover',
                                    ),
                                  ],
                                ),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context) {
                                        store!.listFilter[index].status =
                                            TypeStatus.ok;
                                        store!.listFilter[index].check = true;

                                        store!
                                            .changeSelected(store!.typeChoiced);
                                      },
                                      backgroundColor: const Color(0xFF7BC043),
                                      foregroundColor: Colors.white,
                                      icon: Icons.check,
                                      label: 'Concluido',
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isThemeDark
                                          ? secondaryDardColor
                                          : secondaryLightColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Observer(builder: (context) {
                                    return CheckboxListTile(
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            color:
                                                store!.listFilter[index].check
                                                    ? secondaryDardColor
                                                    : Colors.white),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor: greenColor,
                                      onChanged: ((value) {
                                        if (store!.listFilter[index].status ==
                                            TypeStatus.edit) {
                                          setState(() {
                                            store!.listFilter[index].check =
                                                !store!.listFilter[index].check;
                                          });
                                        }
                                      }),
                                      value: store!.listFilter[index].check,
                                      title: Observer(builder: (context) {
                                        return Text(
                                          store!.listFilter[index].name,
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: isThemeDark
                                                ? Colors.white
                                                : Colors.white,
                                            decoration:
                                                store!.listFilter[index].check
                                                    ? TextDecoration.lineThrough
                                                    : null,
                                          ),
                                        );
                                      }),
                                      subtitle: Text(
                                        store!.listFilter[index].description,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: isThemeDark
                                              ? Colors.white54
                                              : Colors.white54,
                                          decoration:
                                              store!.listFilter[index].check
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const ButtonAdd(),
    );
  }
}
