import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/model/item.dart';

class MyListItem extends StatefulWidget {
  final Item item;

  const MyListItem({Key? key, required this.item}) : super(key: key);

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> with TickerProviderStateMixin {
  late final AnimationController scaleController;
  late Animation<double> scaleTween;

  @override
  void initState() {
    print("initState is called in my list item 1");
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleTween = Tween(begin: widget.item.begin, end: widget.item.end)
        .animate(scaleController);

    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print(AnimationStatus.completed);
        final temp=widget.item.begin;
        widget.item.begin=widget.item.end;
        widget.item.end=temp;
      }
      else if(status == AnimationStatus.reverse){
        final temp=widget.item.end;
        widget.item.end=widget.item.begin;
        widget.item.begin=temp;
      }
      else if (status == AnimationStatus.dismissed) {
        print(AnimationStatus.dismissed);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: InkWell(
        onTap: () async {
          if(scaleController.isCompleted){
            scaleController.reverse();
          }else{
            scaleController.forward();
          }
        },
        child: ScaleTransition(
          scale: scaleTween,
          child: Container(
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
