import 'package:ebot/utility/common_function.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppHiveDb {
  static String dbName = "myHivedb";

  static Future<dynamic> setConversation(
      List<dynamic> formattedMessages) async {
    try {
      Box box = await Hive.openBox(dbName);
      var title = await getConversionTitle();
      var messages = {"title": title, "message": formattedMessages};
      box.add(messages);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> getAllConversation() async {
    try {
      Box box = await Hive.openBox(dbName);
      return box.toMap();
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> clearAllConversation() async {
    try {
      Hive.box(dbName).clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> clearSingleConversation(int index) async {
    try {
      Box box = await Hive.openBox(dbName);
      box.deleteAt(index);

      return true;
    } catch (e) {
      return false;
    }
  }
}
