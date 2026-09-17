class MenuFood {
  String nama;
  int _harga; 

  MenuFood(this.nama, this._harga);

  
  int get harga => _harga;
}

void main() {
 
  var makanan = MenuFood("Mie Ayam", 12000);


  print("Nama  : ${makanan.nama}");
  print("Harga : Rp${makanan.harga}");
}