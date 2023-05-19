import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_management_system/common/config/app_config.dart';
import 'package:permission_handler/permission_handler.dart';

void logger(String message) {
  log('app_logger: {$message}');
}

hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String formatCurrency(dynamic number) {
  if (isNullEmptyFalseOrZero(number) || !isNumeric(number)) {
    return '0';
  }
  dynamic numberConvert;
  if (number is String) {
    numberConvert = int.tryParse(number) ?? double.tryParse(number);
  } else {
    numberConvert = number;
  }
  return NumberFormat("#,###", AppConfig.defaultLocate)
      .format(numberConvert ?? 0);
}

String formatPhoneNumber(String phoneNumber) {
  var filterText = phoneNumber;
  if (isNullEmpty(filterText)) return '';
  filterText = filterText.replaceAll(' ', '');
  if (filterText.length < 2) return filterText;
  final firstChars = filterText.substring(0, 2);
  if (firstChars == '09' ||
      firstChars == '08' ||
      firstChars == '07' ||
      firstChars == '03' ||
      firstChars == '05') {
    if (filterText.length > 3) {
      filterText = '${filterText.substring(0, 3)} ${filterText.substring(3)}';
    }
    if (filterText.length > 7) {
      filterText = '${filterText.substring(0, 7)} ${filterText.substring(7)}';
    }
  }
  return filterText.trim();
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) =>
    o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}

Future<bool> checkPermission(Permission permission) async {
  final status = await permission.request();
  return status.isGranted;
}

String cleanPhoneNumber(String phone) {
  phone = phone.replaceAll('+84', '0');
  phone = phone.replaceAll('-', '');
  phone = phone.replaceAll(' ', '');
  return phone;
}

String getGlobalPhone(String phone) {
  return phone.replaceFirst('0', '+84');
}

String dateFormat(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

String getStringYmd(String date) {
  final ymd = date.split(' ').first;
  return ymd.replaceAll('-', '');
}

String convertCurrencyTextStyle(double value) {
  int length = value.toInt().toString().length;
  if (length >= 4 && length < 7) {
    return '${value ~/ math.pow(10, 3)}K';
  } else if (length >= 7 && length < 10) {
    return '${value ~/ math.pow(10, 6)}M';
  } else if (length >= 11 && length < 14) {
    return '${value ~/ math.pow(10, 9)}T';
  } else if (length >= 14 && length < 17) {
    return '${value ~/ math.pow(10, 12)}B';
  }
  return value.toInt().toString();
}
