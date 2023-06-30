class CartItem {
  final String mname;
  final String name;
  final double price;
  List<String>? checkedExtras;


  CartItem({required this.mname,required this.name, required this.price,this.checkedExtras});

  @override
  String toString() {
    return 'mname:$mname,name: $name, price: $price,checkedExtras: $checkedExtras';
  }
}
