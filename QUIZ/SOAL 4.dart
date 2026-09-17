void main() {
  
  Map<String, dynamic> mahasiswa = {
    'Nama': 'Budi',
    'NIM': '230101',
    'Jurusan': 'Teknik Informatika',
    'Nilai': 85,
  };


  int nilai = mahasiswa['Nilai'];
  String status = (nilai >= 75) ? 'Lulus' : 'Tidak Lulus';
  mahasiswa['Status'] = status;


  print('=== DATA MAHASISWA ===');
  mahasiswa.forEach((key, value) {
    print('${key.padRight(8)} : $value');
  });
}