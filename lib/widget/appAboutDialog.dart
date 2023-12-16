import 'package:flutter/material.dart';

class AppAboutDialog {
  showAppAboutDialog(context) {
    showAboutDialog(
      context: context,
      applicationName: 'My Wall',
      applicationVersion: 'by Girish Parate 1.0',
      applicationLegalese: 'All images are provided by unsplash.com',
    );
  }
}
