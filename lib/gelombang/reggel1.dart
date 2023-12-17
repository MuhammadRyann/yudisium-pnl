// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../navigasi.dart';

class DaftarYudisSatu extends StatefulWidget {
  const DaftarYudisSatu({Key? key}) : super(key: key);

  @override
  _DaftarYudisSatuState createState() => _DaftarYudisSatuState();
}

class _DaftarYudisSatuState extends State<DaftarYudisSatu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;

  Uint8List? _buktiBayar;
  Uint8List? _iuran;
  Uint8List? _buktiSidang;
  Uint8List? _foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File - Gelombang 1'),
        backgroundColor: const Color(0xFFFFD600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'PENDAFTARAN YUDISIUM TAHUN 2023',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Gelombang 1',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _filepicker(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD600),
                fixedSize: const Size(350, 53),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Bukti Pembayaran Yudisium'),
                  Container(
                    child: _buktiBayar != null
                        ? const Icon(Icons.done)
                        : const Icon(Icons.upload),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _filepicker(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD600),
                fixedSize: const Size(350, 53),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Iuran Himpunan'),
                  Container(
                    child: _iuran != null
                        ? const Icon(Icons.done)
                        : const Icon(Icons.upload),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _filepicker(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD600),
                fixedSize: const Size(350, 53),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Bukti Sudah Sidang'),
                  Container(
                    child: _buktiSidang != null
                        ? const Icon(Icons.done)
                        : const Icon(Icons.upload),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _imagepicker(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD600),
                fixedSize: const Size(350, 53),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Foto Formal'),
                  Container(
                    child: _foto != null
                        ? const Icon(Icons.done)
                        : const Icon(Icons.upload),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveFileToFirestore,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD600),
              ),
              child: const Text(
                'Upload',
              ),
            )
          ],
        ),
      ),
    );
  }

  void _saveFileToFirestore() async {
    try {
      _user = _auth.currentUser!;
      String uid = _user.uid;
      String buktiBayar = 'gelombang1/$uid/buktibayar.pdf';
      String iuran = 'gelombang1/$uid/Iuran.pdf';
      String buktiSidang = 'gelombang1/$uid/buktisidang.pdf';
      String poto = 'gelombang1/$uid/paspoto.jpg';
      SettableMetadata metadata =
          SettableMetadata(contentType: 'application/pdf');
      SettableMetadata metadatakhusus =
          SettableMetadata(contentType: 'image/jpg');
      // buktiBayar
      UploadTask uploadBuktiBayar = FirebaseStorage.instance
          .ref()
          .child(buktiBayar)
          .putData(_buktiBayar!, metadata);

      await uploadBuktiBayar.whenComplete(() async {
        String buktiBayarUrl =
            await FirebaseStorage.instance.ref(buktiBayar).getDownloadURL();
        // iuran
        UploadTask uploadIuran = FirebaseStorage.instance
            .ref()
            .child(iuran)
            .putData(_iuran!, metadata);

        await uploadIuran.whenComplete(() async {
          String iuranUrl =
              await FirebaseStorage.instance.ref(iuran).getDownloadURL();
          // buktiSidang
          UploadTask uploadBuktiSidang = FirebaseStorage.instance
              .ref()
              .child(buktiSidang)
              .putData(_buktiSidang!, metadata);

          await uploadBuktiSidang.whenComplete(() async {
            String buktiSidangUrl = await FirebaseStorage.instance
                .ref(buktiSidang)
                .getDownloadURL();
            // Paspoto
            UploadTask uploadPoto = FirebaseStorage.instance
                .ref()
                .child(poto)
                .putData(_foto!, metadatakhusus);

            await uploadPoto.whenComplete(() async {
              String potoUrl =
                  await FirebaseStorage.instance.ref(poto).getDownloadURL();

              await _firestore
                  .collection('Pengguna')
                  .doc(_user.uid)
                  .collection('Gelombang 1')
                  .doc('Data File')
                  .set(
                {
                  'Bukti Pembayaran Yudisium': buktiBayarUrl,
                  'Iuran Himpunan': iuranUrl,
                  'Bukti Sudah Sidang': buktiSidangUrl,
                  'Pas Photo': potoUrl,
                },
              );
            });
          });
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data Saved'),
          duration: Duration(seconds: 4),
        ),
      );
      navToHomePage(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _filepicker(int buttonIndex) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      setState(() {
        switch (buttonIndex) {
          case 0:
            _buktiBayar = result.files.first.bytes;
            break;
          case 1:
            _iuran = result.files.first.bytes;
            break;
          case 2:
            _buktiSidang = result.files.first.bytes;
            break;
        }
      });
    } else {
      return;
    }
  }

  Future<void> _imagepicker(int buttonIndex) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);

    if (result != null) {
      setState(() {
        switch (buttonIndex) {
          case 0:
            _foto = result.files.first.bytes;
            break;
        }
      });
    } else {
      return;
    }
  }
}
