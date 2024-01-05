// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  // Function to open WhatsApp link
  void _launchWhatsApp() async {
    const url = 'https://wa.me/1234567890'; // Replace with your WhatsApp number
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Information about your app or company goes here.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _launchWhatsApp,
              child: const Text(
                'Contact us on WhatsApp',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}