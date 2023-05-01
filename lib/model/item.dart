class Item {
  final String name;
  bool isSelected=false;
  double begin = 1.0;
  double end =2.0;

  Item(this.name,{required this.begin, required this.end,this.isSelected=false});

  initAnimationValue(){
    begin = 1.0;
    end =2.0;
  }

  @override
  String toString() {
    return 'Item{name: $name, isSelected: $isSelected, begin: $begin, end: $end}';
  }
}
