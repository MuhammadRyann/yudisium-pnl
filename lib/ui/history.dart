// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 281,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            color: const Color(0xFFFFD600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 172,
                  child: Center(
                    child: Image.asset(
                      'assets/pnl.png',
                      width: 177,
                      height: 172,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Riwayat',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            decoration: ShapeDecoration(
              color: const Color(0xFFEDEDD9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_userData['nama']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const Text('Tanggal Pendaftaran : Rabu, 12 Oktober 2023'),
                    const Text('Jam Pendaftaran : 13:05:00'),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 200,
                      height: 2,
                      color: Colors.black54,
                    ),
                    const Text('Status : SUDAH TERDAFTAR'),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getUserData() async {
    try {
      _user = _auth.currentUser!;

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection('User').doc(_user.uid).get();

      setState(() {
        _userData = userData.data() ?? {};
      });
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }
}
