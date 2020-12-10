import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const locale = "tr_TR";

DateFormat timeFormat = new DateFormat();






class Time {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  main() {


    initializeDateFormatting(locale).then((_) {
      timeFormat = DateFormat.Hm(locale);
    });

    final dateTimeFormat =  DateFormat.MMMMd(locale).add_Hm();
    final String as = dateTimeFormat.format(now);
    return as.toString().substring(0,8);
  }
}