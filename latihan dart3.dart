class Mahasiswa {
  String nama;
  String alamat;
  int usia;

  Mahasiswa({this.nama = "", this.alamat = "", this.usia = 0});
}

void main() {
  Mahasiswa mhs = Mahasiswa(nama: "maman", alamat: "cijalu", usia: 18);
  print(mhs.nama);
}
