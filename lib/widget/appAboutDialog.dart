import 'package:flutter/material.dart';

class AppAboutDialog {
  showAppAboutDialog(context) {
    showAboutDialog(
      context: context,
      applicationName: 'My Wall',
      applicationVersion: 'by Girish Parate 1.0',
      applicationLegalese: 'All images are provided by unsplash.com',
      // children: [
      //   Consumer<ThemeNotifier>(
      //     builder: (context, notifier, child) => SwitchListTile(
      //       title: Text("Dark Mode"),
      //       onChanged: (val) {
      //         notifier.toggleTheme(val);
      //       },
      //       value: notifier.darkTheme,
      //     ),
      //   ),
      // ]
    );
  }
}
