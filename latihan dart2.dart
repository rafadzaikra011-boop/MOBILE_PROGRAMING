class Mahasiswa {
  // Constructor = method yang dijalankan secara otomatis saaat objek dibuat

  Mahasiswa() {
    print("ini pesan dari method constructor");
  }
  void sapa() {
    print("Aku mahasiswa");
  }
}

void main() {
  Mahasiswa mhs = Mahasiswa();
  Mahasiswa mhs2 = Mahasiswa();
  Mahasiswa mhs3 = Mahasiswa();

}
