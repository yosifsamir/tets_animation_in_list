import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/model/item.dart';
import 'package:untitled/my_list_view.dart';
import 'package:untitled/my_list_view_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  List<Item> items = [
    Item("item 1",begin: 1.0,end: 1.5),
    Item("item 2",begin: 1.0,end: 1.5),
    Item("item 3",begin: 1.0,end: 1.5),
    Item("item 4",begin: 1.0,end: 1.5),

  ];
  List<Item> items2 = [
    Item("item 1",begin: 1.0,end: 1.5),
    Item("item 2",begin: 1.0,end: 1.5),
    Item("item 3",begin: 1.0,end: 1.5),
    Item("item 4",begin: 1.0,end: 1.5),

  ];
  // Item? selectedItem;

  late final AnimationController scaleController;
  late final Animation<double> scaleTween;

  @override
  void initState() {
    super.initState();
    scaleController=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    scaleTween=Tween(begin: 1.0,end: 2.0).animate(scaleController);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child:Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * .1,
                    child: MyListView(items: items)),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child:Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * .1,
                    child: MyListView2(items: items2)),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

