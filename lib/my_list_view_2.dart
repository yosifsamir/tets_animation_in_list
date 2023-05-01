import 'package:flutter/material.dart';
import 'package:untitled/model/item.dart';
import 'package:untitled/my_list_item_2.dart';

class MyListView2 extends StatefulWidget {
  final List<Item> items;

  const MyListView2({Key? key, required this.items}) : super(key: key);

  @override
  State<MyListView2> createState() => _MyListView2State();
}

class _MyListView2State extends State<MyListView2> {
  bool playAnimation = false;
  Item? currentItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MyListItem2(
            item: widget.items[index],
            playAnimation: playAnimation,
            callback: (item) async {
              print(item);
              print("currentItem ${currentItem}");
              if(currentItem == null){
                setState(() {
                  currentItem = item;
                  currentItem?.isSelected = true;
                });
              }
              else {
                setState(() {
                  currentItem?.isSelected=false;
                });
                // await Future.delayed(const Duration(seconds: 3));
                setState(() {
                  currentItem=null;
                  currentItem = item;
                  currentItem?.isSelected=true;
                  // currentItem?.isSelected = false;
                  // currentItem=null;
                });
              }
              // await Future.delayed(const Duration(seconds: 3));

            },
          );
        },
        itemCount: widget.items.length,
        shrinkWrap: true);
  }
}
