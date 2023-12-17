import 'package:flutter/material.dart';
import 'gelombang/gel1.dart';
import 'gelombang/gel2.dart';
import 'gelombang/reggel1.dart';
import 'gelombang/reggel2.dart';
import 'sign/login.dart';
import 'sign/register.dart';
import 'ui/homepage.dart';
import 'ui/informasi.dart';
import 'ui/subinformasi/DokumenPendukung.dart';
import 'ui/subinformasi/manualbook.dart';
import 'ui/subinformasi/syaratdaftar.dart';

void navToRegisPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RegistrationPage()),
  );
}

void navToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}

void navToHomePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
}

void navToYudisGelSatuPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const YudisGelSatu()),
  );
}

void navToYudisGelDuaPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const YudisGelDua()),
  );
}

void navToDaftarYudisGelSatuPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DaftarYudisSatu()),
  );
}

void navToDaftarYudisGelDuaPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DaftarYudisDua()),
  );
}

void navToDocPendukung(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DokumenPendukungContent()),
  );
}

void navToManualBook(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ManualBookContent()),
  );
}

void navToInfoPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const InformasiPage()),
  );
}

void navToSyaratPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SyaratPendaftaranContent()),
  );
}
