void main() {
  // objek mahasiswa
  Mahasiswa ase = Mahasiswa();
  ase.motoHidup();
  ase.nama = "maman sulaeman";
  print(ase.nama);
}

class Mahasiswa {
  //deklarasi property
  String? nama;
  String? alamat;
  String nipd = "1234";
  int? usia;

  //deklarasi method
  void motoHidup() {
    print("Coding adalah jalan ninjaku...!");
  }

  void cetakIdentitas() {
    print("Nama : ${nama}");
    print("Alamat : ${alamat}");
    print("Usia : ${usia}");
  }
}
