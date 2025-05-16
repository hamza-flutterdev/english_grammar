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
        print("Error creating directory");
      }

      ByteData data = await rootBundle.load('assets/database/learnenglish.db');
      List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes, data.lengthInBytes
      );
      await File(path).writeAsBytes(bytes);
    } else {
      print("Database already exists.");
    }
    _db = await openDatabase(path);
  }

  /// Function to fetch Family Members data
  Future<List<Map<String, dynamic>>> fetchFamilyMembers(List<String> myList) async {
    if (_db == null) {
      throw Exception("Database not initialized. Call initDatabase first.");
    }
    final List<String> familyRecord =myList;
    final placeholders = List.filled(familyRecord.length, '?').join(', ');
    final List<Map<String, dynamic>> familyMap = await _db.query(
      'english_data',
      where: 'subCategory IN ($placeholders)',
      whereArgs: familyRecord,
    );
    return familyMap; // Returning the raw data as a list of maps
  }

  Future<List<Map<String, dynamic>>> searchWord(String query) async {
    if (_db == null) {
      throw Exception("Database not initialized. Call initDatabase first.");
    }

    // Trim and check for space at the end
    final trimmed = query.trim();
    final hasTrailingSpace = query.endsWith(' ');

    List<Map<String, dynamic>> result;

    if (hasTrailingSpace) {
      // Exact match only (either Urdu or English)
      result = await _db.query(
        'dictionary',
        where: 'word = ? OR meaning = ?',
        whereArgs: [trimmed, trimmed],
      );
    } else {
      // Suggest similar matches
      result = await _db.query(
        'dictionary',
        where: 'word LIKE ? OR meaning LIKE ?',
        whereArgs: ['%$trimmed%', '%$trimmed%'],
      );
    }

    return result;
  }



}

