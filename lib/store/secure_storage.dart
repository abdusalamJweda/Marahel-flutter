import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create an instance and enable secure encryption:
  static const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<void> saveData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    String? token; 
    try {
      token = await storage.read(key: key).then((value) => token = value);
    } on Exception catch (e) {
      print(e);
    }
    return token;
  }

  static Future<Map<String, String>> readAllData(String key) async {
    return await storage.readAll();
  }

  static Future<bool> containsData(String key) async {
    return await storage.containsKey(key: key);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  static Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}