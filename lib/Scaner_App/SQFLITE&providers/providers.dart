import 'package:flutter/material.dart';
import 'DataBaseHelper.dart';
import 'QR_CodeData.dart';

class HistoryProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<QrCodeData> _qrCodes = [];
  List<QrCodeData> _favoriteQrCodes = [];
  List<QrCodeData> get qrCodes => _qrCodes;
  List<QrCodeData> get favoriteQrCodes => _favoriteQrCodes;

  Future<void> loadQrCodes() async {
    await _databaseHelper.initDatabase();
    _qrCodes = await _databaseHelper.getQrCodes();
    notifyListeners();
  }

  Future<void> loadFavoriteQrCodes() async {
    await _databaseHelper.initDatabase();
    _favoriteQrCodes = await _databaseHelper.getFavoriteQrCodes();
    notifyListeners();
  }

  Future<void> addQrCode(QrCodeData qrCode) async {
    await _databaseHelper.insertQrCode(qrCode);
    _qrCodes.add(qrCode);
    notifyListeners();
  }

  Future<void> addFavorite(QrCodeData qrCode) async {
    await _databaseHelper.addFavorite(qrCode.id);
    _favoriteQrCodes.add(qrCode);
    notifyListeners();
  }

  Future<void> removeFavorite(QrCodeData qrCode) async {
    await _databaseHelper.removeFavorite(qrCode.id);
    _favoriteQrCodes.remove(qrCode);

    notifyListeners();

  }

  Future<void> removeQR(QrCodeData qrCode) async {
    if (qrCode.id==null) {
      await _databaseHelper.removeQrCode(qrCode.id);
      _qrCodes.remove(qrCode);
      notifyListeners();

    }  else{
      await _databaseHelper.removeQrCode(qrCode.id);
      _qrCodes.remove(qrCode);
      notifyListeners();
    }

  }

}
