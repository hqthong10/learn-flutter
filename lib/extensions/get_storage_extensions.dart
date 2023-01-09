import 'package:get_storage/get_storage.dart';
import 'package:learn_flutter/constant.dart';

extension GetStorageExtension on GetStorage {
  static bool get isVideoAutoPlay =>
      GetStorage().read<bool>(kIsVideoAutoPlay) ?? false;

  static void updateAutoPlay(bool value) {
    GetStorage().write(kIsVideoAutoPlay, value);
  }

  static String get lastLoginTime =>
      GetStorage().read<String>(klastLoginTime) ?? '';

  static void updateLastLoginTime() =>
      GetStorage().write(klastLoginTime, DateTime.now().toIso8601String());

  static String get timeLoadFriend =>
      GetStorage().read<String?>(kTimeLoadFriend) ?? '0';

  static void updateTimeLoadFriend(String? value) =>
      GetStorage().write(kTimeLoadFriend, value);

  static void clearTime() => GetStorage().remove(kTimeLoadFriend);

  static String get transactionKey =>
      GetStorage().read<String>(kTransactionKey) ?? '';

  static void updateTransactionKey(String value) =>
      GetStorage().write(kTransactionKey, value);

  static bool get isShowAlertPhotoVideo =>
      GetStorage().hasData(kAlertPhotoVideo);

  static void didShowAlertPhotoVideo() =>
      GetStorage().write(kAlertPhotoVideo, true);

  static bool get isShowAlertMicroCamera =>
      GetStorage().hasData(kAlertMicroCamera);

  static void didShowAlertMicroCamera() =>
      GetStorage().write(kAlertMicroCamera, true);

  static String get fcmToken => GetStorage().read('fcmToken') ?? '';

  static void updateFcmToken(String value) =>
      GetStorage().write('fcmToken', value);

  static String get apnToken => GetStorage().read('apnToken') ?? '';

  static void updateApnToken(String value) =>
      GetStorage().write('apnToken', value);
}
