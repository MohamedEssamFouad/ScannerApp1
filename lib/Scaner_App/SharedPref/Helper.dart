import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String lastGeneratedQRKey = 'last_generated_qr';
  static const String lastGeneratedBarcodeKey = 'last_generated_barcode';

  static Future<void> saveLastGeneratedQR(String qrData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(lastGeneratedQRKey, qrData);
  }

  static Future<String?> getLastGeneratedQR() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastGeneratedQRKey);
  }

  static Future<void> saveLastGeneratedBarcode(String barcodeData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(lastGeneratedBarcodeKey, barcodeData);
  }

  static Future<String?> getLastGeneratedBarcode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastGeneratedBarcodeKey);
  }
}