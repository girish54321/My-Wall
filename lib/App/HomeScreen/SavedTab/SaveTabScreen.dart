import 'package:flutter/material.dart';
import 'package:reqres_app/App/HomeScreen/SavedTab/SaveTabScreenUI.dart';

class SaveTabScreen extends StatefulWidget {
  const SaveTabScreen({Key? key}) : super(key: key);

  @override
  State<SaveTabScreen> createState() => _SaveTabScreenState();
}

class _SaveTabScreenState extends State<SaveTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SaveTabScreenUI();
  }
}
