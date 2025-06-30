import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class DbHelper {
  late Database _db;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'learnenglish.db');

    final isExist = await databaseExists(path);

    if (!isExist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        debugPrint("Error creating directory");
      }

      ByteData data = await rootBundle.load('assets/database/learnenglish.db');
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes);
    } else {
      debugPrint("Database already exists.");
    }
    _db = await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> fetchBySubcategories(
    List<String> myList,
  ) async {
    final List<String> familyRecord = myList;
    final placeholders = List.filled(familyRecord.length, '?').join(', ');
    final List<Map<String, dynamic>> familyMap = await _db.query(
      'english_data',
      where: 'subCategory IN ($placeholders)',
      whereArgs: familyRecord,
    );
    return familyMap;
  }

  Future<List<Map<String, dynamic>>> searchWord(String query) async {
    final trimmed = query.trim();
    final hasTrailingSpace = query.endsWith(' ');

    List<Map<String, dynamic>> exactMatches = [];
    List<Map<String, dynamic>> partialMatches = [];

    if (hasTrailingSpace) {
      exactMatches = await _db.query(
        'dictionary',
        where: 'word = ? OR meaning = ?',
        whereArgs: [trimmed, trimmed],
      );
    } else {
      exactMatches = await _db.query(
        'dictionary',
        where: 'word = ? OR meaning = ?',
        whereArgs: [trimmed, trimmed],
      );
      partialMatches = await _db.query(
        'dictionary',
        where: '(word LIKE ? OR meaning LIKE ?) AND word != ? AND meaning != ?',
        whereArgs: ['%$trimmed%', '%$trimmed%', trimmed, trimmed],
      );
    }
    return [...exactMatches, ...partialMatches];
  }
}
