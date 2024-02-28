import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class QrCodeData {
   late final dynamic id;
  final String qrData;
  final DateTime timestamp;
  final String processName;
  final String iconIdentifier;
  bool isFavorite;

  QrCodeData({
    this.id,
    required this.qrData,
    required this.timestamp,
    required this.processName,
    required this.iconIdentifier,
    this.isFavorite = false,
  });


  String get formattedDate {
    return DateFormat.yMMMd().format(timestamp);
  }


  String get formattedTime {
    return DateFormat.jm().format(timestamp);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'qr_data': qrData,
      'timestamp': timestamp.toIso8601String(),
      'process_name': processName,
      'icon_identifier': iconIdentifier,
      'is_favorite': isFavorite ? 1 : 0,

    };
  }
  IconData getIcon() {
    switch (iconIdentifier) {
      case 'call':
        return Icons.call;
      case 'contact':
        return Icons.contact_page;
      case 'content':
        return Icons.copy;
      case 'email':
        return Icons.email;
      case 'event':
        return Icons.event;
      case 'sms':
        return Icons.sms;
      case 'text':
        return Icons.copy;
      case 'wifi':
        return Icons.wifi;
      case 'location':
        return Icons.location_on;
      case 'BARCODE':
        return Icons.qr_code_scanner_rounded;
      case 'Scanner':
        return Icons.document_scanner_sharp;
      case 'website':
        return Icons.web;
      default:
        return Icons.add;
    }
  }
}
