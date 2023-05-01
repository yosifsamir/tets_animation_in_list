import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/model/item.dart';

class MyListItem2 extends StatefulWidget {
  final Item item;
  bool? playAnimation;
  void Function(Item item)? callback;

  MyListItem2({Key? key, required this.item, required this.playAnimation,required this.callback}) : super(key: key);

  @override
  State<MyListItem2> createState() => _MyListItem2State();
}

class _MyListItem2State extends State<MyListItem2> with TickerProviderStateMixin {
  late final AnimationController scaleController;
  late Animation<double> scaleTween;

  @override
  void initState() {
    print("initState is called");
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleTween = Tween(begin: widget.item.begin, end: widget.item.end)
        .animate(scaleController);

    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print(AnimationStatus.completed);
        // final temp=widget.item.begin;
        // widget.item.begin=widget.item.end;
        // widget.item.end=temp;
      }
      else if(status == AnimationStatus.reverse){
        print(AnimationStatus.reverse);
        // widget.item.initAnimationValue();
      }
      else if (status == AnimationStatus.dismissed) {

      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyListItem2 oldWidget) {
    print("didUpdateWidget is called and item isSelected is ==> ${widget.item.isSelected}");
    if(widget.item.isSelected==true){
      scaleController.forward();
      // reverseAnimationValueInModel();
    }else{
      // widget.item.initAnimationValue();
      scaleController.reverse();
      // reverseAnimationValueInModel();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("Dispose is called");
    scaleController.dispose();
    widget.callback=null; //don't forget this otherwise you will fall into memory leaks
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: InkWell(
        onTap: () {
          // widget.playAnimation=!(widget.playAnimation??false);
          // if(widget.playAnimation??false){
          //   scaleController.forward();
          // }else{
          //   scaleController.reverse();
          // }
          widget.callback!(widget.item);
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

  void reverseAnimationValueInModel() {
    final temp=widget.item.begin;
    widget.item.begin=widget.item.end;
    widget.item.end=temp;
  }
}