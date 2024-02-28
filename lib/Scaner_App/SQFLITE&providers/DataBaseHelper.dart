import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'QR_CodeData.dart';

class DatabaseHelper {

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'qr_code_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE qr_codes('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'qr_data TEXT, '
              'timestamp TEXT, '
              'process_name TEXT, '
              'icon_identifier TEXT, '
              'is_favorite INTEGER'
              ')',
        );
      },
      version: 1,
    );
    print('Database initialized');
  }

  Future<void> insertQrCode(QrCodeData qrCode) async {
    await _database.insert(
      'qr_codes',
      qrCode.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeQrCode(int id) async {
    await _database.delete(
      'qr_codes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<QrCodeData>> getQrCodes() async {
    final List<Map<String, dynamic>> maps = await _database.query('qr_codes');
    return List.generate(maps.length, (i) {
      return QrCodeData(
        id: maps[i]['id'],
        qrData: maps[i]['qr_data'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
        processName: maps[i]['process_name'],
        iconIdentifier: maps[i]['icon_identifier'],
        isFavorite: maps[i]['is_favorite'] == 1,
      );
    },
    );
  }

  Future<void> addFavorite(int id) async {
    await _database.update(
      'qr_codes',
      {'is_favorite': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> removeFavorite(int id) async {
    await _database.update(
      'qr_codes',
      {'is_favorite': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<QrCodeData>> getFavoriteQrCodes() async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'qr_codes',
      where: 'is_favorite = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return QrCodeData(
        id: maps[i]['id'],
        qrData: maps[i]['qr_data'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
        processName: maps[i]['process_name'],
        iconIdentifier: maps[i]['icon_identifier'],
        isFavorite: true,
      );
    });
  }



}