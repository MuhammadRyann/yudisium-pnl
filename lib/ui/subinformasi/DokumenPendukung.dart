// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DokumenPendukungContent extends StatelessWidget {
  const DokumenPendukungContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Manual Book'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulir Pendaftaran Yudisium\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ini adalah formulir resmi yang biasanya disediakan oleh institusi pendidikan Anda. Anda perlu mengisi formulir ini dengan informasi pribadi dan akademik Anda.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Transkrip Nilai\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Transkrip nilai resmi yang mencantumkan semua mata kuliah yang Anda ambil selama studi, serta nilai yang Anda peroleh. Pastikan transkrip ini adalah yang terbaru dan lengkap.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sertifikat Kelulusan Program Studi\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ini adalah sertifikat atau surat keterangan yang menegaskan bahwa Anda telah menyelesaikan semua persyaratan program studi yang diperlukan.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Bukti Pembayaran Biaya Yudisium\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ini adalah bukti pembayaran biaya yudisium sesuai dengan ketentuan yang berlaku di institusi Anda.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Kartu Identitas\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Identifikasi diri yang sah, seperti kartu mahasiswa atau kartu tanda penduduk (KTP).\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pas Foto\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Biasanya, satu atau beberapa pas foto terbaru dengan format dan ukuran tertentu mungkin diperlukan.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Surat Permohonan\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Beberapa institusi mungkin meminta Anda untuk menulis surat permohonan resmi yang berisi permintaan untuk mengikuti yudisium.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Bukti Pembayaran Tunggakan\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jika Anda memiliki tunggakan biaya kuliah atau denda lainnya, Anda mungkin perlu membawa bukti pembayaran yang menunjukkan bahwa Anda telah melunasi semua kewajiban keuangan.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Bukti Persyaratan Khusus\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jika ada persyaratan khusus, seperti pengumpulan tesis atau proyek akhir, pastikan untuk menyertakan bukti penyelesaiannya.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Surat Izin\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jika Anda tidak dapat menghadiri upacara yudisium dan memerlukan izin khusus, Anda mungkin perlu menyertakan surat izin yang sesuai.\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
