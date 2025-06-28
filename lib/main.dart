import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import ini// optional: buat buka link

void main() {
  runApp(ProfilParadiseApp());
}

class ProfilParadiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Paradise',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String imageUrl = 'https://raw.githubusercontent.com/RazxSR/vokasi_application/refs/heads/main/images/1a302bd8d1f44789d19e0747d13a71cc.jpg'; // placeholder image
  final String name = 'Razak Syauqi Ramadhan';
  final String bio = 'Antusias flutter dan masa depan pengembang mobile.';
  final String contact = 'razaksyauqi2010@gmail.com';

  // Fungsi membuka URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Paradise'),
        backgroundColor: const Color.fromARGB(255, 51, 38, 233),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Foto profil
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 32),

            // Informasi pengguna
            Text(
              name,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              bio,
              style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Kontak: $contact',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 40),

           // Ikon media sosial
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                // Mengubah Icons.web menjadi FontAwesomeIcons.twitter
                icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 40),
                onPressed: () => _launchURL('https://twitter.com/zakSq2131'),
              ),
              IconButton(
                // Mengubah Icons.camera_alt menjadi FontAwesomeIcons.instagram
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink, size: 40),
                onPressed: () => _launchURL('https://www.instagram.com/koneko.0101/'),
              ),
              IconButton(
                // Mengubah Icons.code menjadi FontAwesomeIcons.github
                icon: FaIcon(FontAwesomeIcons.github, color: const Color.fromARGB(255, 0, 0, 0), size: 40),
                onPressed: () => _launchURL('https://github.com/RazxSR'),
              ),
              IconButton(
                // Mengubah Icons.camera_alt menjadi FontAwesomeIcons.instagram
                icon: FaIcon(FontAwesomeIcons.discord, color: const Color.fromARGB(255, 28, 14, 226), size: 40),
                onPressed: () => _launchURL('https://discord.com/kyrios6428'),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
} 