import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/model/item.dart';
import 'package:untitled/my_list_item.dart';

class MyListView extends StatefulWidget {
  final List<Item> items;
  const MyListView({Key? key, required this.items}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MyListItem(item: widget.items[index],);
        },
        itemCount: widget.items.length,
        shrinkWrap: true);
  }
}
