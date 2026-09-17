class Food {
  String name;
  int price;

  Food(this.name, this.price);

  void displayInfo() {
    print("Nama : $name");
    print("Harga : Rp$price\n");
  }
}

class Drink extends Food {
  
  Drink(String name, int price) : super(name, price);


  @override
  void displayInfo() {
    print("Nama  : $name");
    print("Harga : Rp$price\n");
  }
}

void main() {
 
  Food ayamGeprek = Food("Ayam Geprek", 18000);
  Drink esTeh = Drink("Es Teh", 5000);


  List<Food> products = [ayamGeprek, esTeh];

  print("=== DAFTAR PRODUK ===");
  

  for (var product in products) {
    product.displayInfo();
  }
}
