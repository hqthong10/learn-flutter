import 'dart:convert';
import 'dart:io';

import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_flutter/constant.dart';
import 'package:learn_flutter/extensions/get_storage_extensions.dart';
import 'package:learn_flutter/main.dart';
import 'package:learn_flutter/model/user/n100.dart';
import 'package:learn_flutter/pigeons/user_pigeon.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'notification_center.dart';

class UserManager {
  static late UserData userData;
  static N100Model? userLocal;
  static N100Model? userAppGroup;
  static String uuid = '';

  static int get fo100 => userLocal?.pn100 ?? userAppGroup?.pn100 ?? 0;
  static String get mail => userLocal?.nv103 ?? userAppGroup?.nv103 ?? '';
  static String get pvLogin => userLocal?.nv101 ?? userAppGroup?.nv101 ?? '';
  static String get token => userLocal?.nv102 ?? userAppGroup?.nv102 ?? '';

  static final userApi = UserDataApi();

  static bool didLogin = false;

  static int currentPage = 0;

  static Future<void> getUserData() async {
    userData = await userApi.getUserData();
    uuid = userData.uuid ?? '';
    userLocal = parseUser(userData.userLocal);
    userAppGroup = parseUser(userData.userAppGroup);

    userAppGroup ??= N100Model(pn100: userData.pn100, nv102: userData.token);
    printWrapped('uuid: $uuid');
    printWrapped('userLocal ${userLocal?.toJson()}');
    printWrapped('userAppGroup ${userAppGroup?.toJson()}');
  }

  static N100Model? parseUser(String? jsonString) {
    if (jsonString != null && jsonString.isNotBlank) {
      return N100Model.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static void setEmptyUser() {
    userLocal = null;
    userAppGroup = null;
  }

  static void doneLogin(N100Model user, bool updateTime) {
    userLocal = user;
    didLogin = true;
    // GetStorage().write(kIsVideoAutoPlay, user.isAutoPlay);
    if (updateTime) {
      GetStorageExtension.updateLastLoginTime();
    }
    saveUser();
    // NotificationCenter.registerNotification();
    Get.updateLocale(Locale(deviceLanguage));
    initAutoStart();
  }

  static void saveUser() async {
    await userApi.save(UserData(userLocal: jsonEncode(userLocal?.toJson())));
  }

  static void deleteUser() async {
    userLocal = null;
    await userApi.save(UserData(userLocal: null));
  }

  static String get deviceLanguage {
    if (userLocal != null) {
      return userLocal?.nv109 ?? 'vi';
    }
    final deviceLanguage = Platform.localeName.substring(0, 2);
    if (['vi', 'en'].contains(deviceLanguage)) {
      return deviceLanguage;
    }
    return 'vi';
  }

  static N100Model? get simplifiedUser => userLocal?.simplifiedUser;

  static bool get havePermissionOfGLAN {
    final fo100s = kListCommentCompany.map((e) => e.fo100).whereType<int>();
    return fo100s.contains(17739) || fo100s.contains(15392);
  }

  static Future<void> initAutoStart() async {
    if (Platform.isAndroid) {
      bool? checkAutoStart = GetStorage().read('checkAutoStart') as bool?;
      debugPrint("initAutoStart $checkAutoStart");
      bool? isAutoStartEnabled =
          await DisableBatteryOptimization.isAutoStartEnabled;
      if (checkAutoStart == null && isAutoStartEnabled != null) {
        await DisableBatteryOptimization.showEnableAutoStartSettings(
          "auto_start_title".tr,
          "auto_start_des".tr,
        );
        GetStorage().write('checkAutoStart', true);
      }
    }
  }
}
