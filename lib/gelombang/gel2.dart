// ignore_for_file: library_private_types_in_public_api, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../navigasi.dart';

class YudisGelDua extends StatefulWidget {
  const YudisGelDua({super.key});

  @override
  _YudisGelDuaState createState() => _YudisGelDuaState();
}

class _YudisGelDuaState extends State<YudisGelDua> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;

  TextEditingController judulTugasAkhir = TextEditingController();
  TextEditingController dospem1 = TextEditingController();
  TextEditingController dospem2 = TextEditingController();
  TextEditingController ipk = TextEditingController();
  TextEditingController motto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pendaftaran Gelombang 2"),
        backgroundColor: const Color(0xFFFFD600),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(height: 20),
          // JUDUL TGA
          const Text(
            "Judul Tugas Akhir",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: judulTugasAkhir,
              decoration: const InputDecoration(
                hintText: "Masukkan jawaban...",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          // DOSPEM 1
          const Text(
            "Dosen Pembimbing 1",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: dospem1,
              decoration: const InputDecoration(
                hintText: "Masukkan jawaban...",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          // DOSEPEM 2
          const Text(
            "Dosen Pembimbing 2",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: dospem2,
              decoration: const InputDecoration(
                hintText: "Masukkan jawaban...",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          // IPK
          const Text(
            "IPK",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: ipk,
              decoration: const InputDecoration(
                hintText: "Masukkan jawaban...",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          // MOTTO
          const Text(
            "Motto",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: motto,
              decoration: const InputDecoration(
                hintText: "Masukkan jawaban...",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          // SELANJUTNYA
          ElevatedButton(
            onPressed: () {
              _simpandata();
              navToDaftarYudisGelDuaPage(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD600),
            ),
            child: const Text(
              "Selanjutnya",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _simpandata() async {
    try {
      _user = _auth.currentUser!;
      await _firestore
          .collection('Pengguna')
          .doc(_user.uid)
          .collection('Gelombang 2')
          .doc('Data Input')
          .set(
        {
          'Judul TGA': judulTugasAkhir.text,
          'Dosen Pembimbing 1': dospem1.text,
          'Dosen Pembimbing 2': dospem2.text,
          'IPK': ipk.text,
          'Motto': motto.text,
          'Gelombang': 'Gelombang 2',
        },
      );
    } catch (e) {}
  }
}
