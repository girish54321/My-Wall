import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormattedDateWidget extends StatelessWidget {
  final String dateString;

  const FormattedDateWidget({Key? key, required this.dateString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat.yMMMMd().add_Hms().format(date);

    return Text(
      formattedDate,
      style: const TextStyle(fontSize: 18),
    );
  }
}
