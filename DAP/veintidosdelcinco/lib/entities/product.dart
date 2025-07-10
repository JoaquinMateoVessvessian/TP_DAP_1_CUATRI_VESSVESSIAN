class Product {
  String name;
  int price;
  Product({required this.name, required this.price});
 bool isFree(){
return this.price==0;
}

}