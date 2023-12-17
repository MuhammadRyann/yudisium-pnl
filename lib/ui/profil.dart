// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 281,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: ShapeDecoration(
                color: const Color(0xFFFFD600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 177,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profil',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 13,
              ),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFEDEDD9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 92,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/p.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Pribadi',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Nama'),
                              Text('Alamat'),
                              Text('Tanggal Lahir'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(': ${_userData['nama']}'),
                              Text(':${_userData['alamat']}'),
                              Text(':${_userData['tgllahir']}'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 200,
                        height: 2,
                        color: Colors.black54,
                      ),
                      const SizedBox(height: 8.0),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                          Text('Email: mhmdryann@gmail.com'),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                          Text('Alamat: Lhokseumawe'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
