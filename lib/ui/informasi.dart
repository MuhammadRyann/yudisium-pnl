// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:yudisium_pnl/navigasi.dart';

// import './form_pendaftaran.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  _InformasiPageState createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    width: 177,
                    height: 172,
                    child: Center(
                      child: Image.asset(
                        'assets/pnl.png', // Gantilah dengan path gambar logo PNL yang sesuai
                        width:
                            177, // Sesuaikan dengan lebar logo yang diinginkan
                        height:
                            172, // Sesuaikan dengan tinggi logo yang diinginkan
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Infomasi',
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      navToManualBook(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFFEDEDD9),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Manual Book',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navToDocPendukung(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFFEDEDD9),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dokumen Pendukung',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navToSyaratPage(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFFEDEDD9),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Syarat Pendaftaran Yudisium',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoButton(String title, dynamic content) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage(title, content)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  final String title;
  final dynamic content;

  const InfoPage(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: content is Widget ? content : Text(content),
        ),
      ),
    );
  }
}
