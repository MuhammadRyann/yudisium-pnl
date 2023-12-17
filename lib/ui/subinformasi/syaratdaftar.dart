import 'package:flutter/material.dart';

class SyaratPendaftaranContent extends StatelessWidget {
  const SyaratPendaftaranContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Syarat Pendaftaran'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Syarat Pendaftaran Yudisium\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text:
                        '- Telah Menyelesaikan Semua Mata Kuliah yang Diperlukan: Biasanya, Anda harus telah menyelesaikan semua mata kuliah yang diperlukan dan mata kuliah pilihan yang ditetapkan dalam kurikulum program studi Anda.\n',
                  ),
                  TextSpan(
                    text:
                        '- Memiliki IPK (Indeks Prestasi Kumulatif) yang Memadai: Beberapa institusi mungkin memiliki syarat minimum IPK yang harus Anda capai untuk bisa mendaftar yudisium. Pastikan untuk memeriksa apakah ada persyaratan IPK dan apakah Anda memenuhinya.\n',
                  ),
                  TextSpan(
                    text:
                        '- Menyelesaikan Proyek Akhir atau Tesis (jika diperlukan): Jika program studi Anda melibatkan proyek akhir atau tesis, Anda harus menyelesaikannya sesuai dengan ketentuan yang berlaku.\n',
                  ),
                  TextSpan(
                    text:
                        '- Tidak Ada Tunggakan Biaya Kuliah: Pastikan bahwa Anda tidak memiliki tunggakan biaya kuliah atau denda perpustakaan. Ini biasanya menjadi salah satu persyaratan yang harus dipenuhi sebelum mendaftar yudisium.\n',
                  ),
                  TextSpan(
                    text:
                        '- Dokumen Akademik yang Lengkap: Anda harus menyediakan transkrip nilai yang lengkap, sertifikat kelulusan program studi, dan dokumen-dokumen akademik lainnya yang mungkin diperlukan oleh institusi Anda.\n',
                  ),
                  TextSpan(
                    text:
                        '- Mengisi Formulir Pendaftaran Yudisium: Isi formulir pendaftaran yudisium dengan benar dan lengkap sesuai petunjuk yang diberikan oleh institusi Anda.\n',
                  ),
                  TextSpan(
                    text:
                        '- Pembayaran Biaya Yudisium: Anda perlu membayar biaya yudisium sesuai dengan ketentuan yang berlaku. Pastikan biaya ini telah dibayarkan sebelum tanggal yang ditentukan.\n',
                  ),
                  TextSpan(
                    text:
                        '- Kartu Identitas yang Sah: Anda mungkin diminta untuk menunjukkan kartu identitas yang sah, seperti kartu mahasiswa atau kartu tanda penduduk (KTP).\n',
                  ),
                  TextSpan(
                    text:
                        '- Kepatuhan terhadap Aturan dan Peraturan: Pastikan Anda memahami dan mematuhi aturan dan peraturan yang berlaku di institusi Anda terkait dengan yudisium.\n',
                  ),
                  TextSpan(
                    text:
                        '- Kehadiran pada Upacara Yudisium (jika diperlukan): Beberapa institusi mungkin mengharuskan Anda untuk menghadiri upacara yudisium secara fisik. Pastikan Anda memeriksa apakah kehadiran pribadi diperlukan.\n',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
