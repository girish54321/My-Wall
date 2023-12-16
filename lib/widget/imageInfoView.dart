import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImageInfoView extends StatelessWidget {
  final String title;
  final int value;
  const ImageInfoView({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('hi');
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(width: 8.0),
          Text(
            formatter.format(value),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
