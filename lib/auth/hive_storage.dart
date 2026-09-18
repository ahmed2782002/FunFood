import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static late Box box;
  // static late Box<GoogleUserModel> box1;

  // Initialize the boxes and register adapters
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register the GoogleUserModel adapter
    // Hive.registerAdapter(GoogleUserModelAdapter());
    // Hive.registerAdapter(UserModelAdapter());

    box = await Hive.openBox('myBox');
    // box1 = await Hive.openBox<GoogleUserModel>('googleUserBox');
    // box2 = await Hive.openBox<UserModel>('userBox');
  }

  // Get value from the generic box
  static dynamic get(String key) {
    try {
      return box.get(key, defaultValue: null);
    } catch (e) {
      return null;
    }
  }

  // Set value in the generic box
  static Future<void> set(String key, dynamic value) async {
    await box.put(key, value);
  }

  // Remove value from the generic box
  static Future<void> remove(String key) async {
    await box.delete(key);
  }

  // Clear all data in the generic box
  static Future<void> clear() async {
    await box.clear();
  }


}
