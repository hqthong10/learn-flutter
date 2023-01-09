import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/model/user/n100.dart';
import 'package:video_player/video_player.dart';

/// FF7A96
const kff7a96Color = Color(0xFFFF7A96);
const kAppColor = Color(0xFFFF7A96);

/// F1974A
const kf1974aColor2 = Color(0xFFF1974A);

/// FF7A96 - F1974A
const kAppColors = [Color(0xFFF3495B), Color(0xFFF1874D)];

/// A9A9A9
const ka9a9a9Color = Color(0xFFA9A9A9);

/// C9C9C9
const kBorderColor = Color(0xFFC9C9C9);

/// ED2932P
const kLiveroomDoneColor = Color(0xFFED2932);

/// 12ca7d
const kWaitingColor = Color(0xFF12ca7d);

/// ff8200
const kWaiting24Color = Color(0xFFff8200);

/// 51, 204, 51
const k33CC33 = Color(0xFF33CC33);

const kLikedColor = Color(0xFFFF1F3D);
const kLikedColors = [Color(0xFFFF7038), Color(0xFFFF1F3D)];

const k005f9dColor = Color(0xFF005f9d);
const k808080Color = Color(0xFF808080);
const k7ac3faColor = Color(0xFF7ac3fa);
const kdcdcdcColor = Color(0xFFdcdcdc);
const kf2f2f6Color = Color(0xFFf2f2f6);
const kf0f0f0Color = Color(0xFFf0f0f0);
const ke8e8e8Color = Color(0xFFe8e8e8);
const kddf0ffColor = Color(0xFFddf0ff);
const kf4faffColor = Color(0xFFf4faff);
const k57d157Color = Color(0xff57d157);
const kLiveColor = Color(0xFFFF0000);
const k686868 = Color(0xFF686868);
const kd5d5d5 = Color(0xFFd5d5d5);
const kf1874d = Color(0xFFF1874D);
const kffc700 = Color(0xFFffc700);
const kf3495b = Color(0xFFF3495B);
const kf4f4f4 = Color(0xFFf4f4f4);
const kfff0f2 = Color(0xFFfff0f2);
const k222222 = Color(0xFF222222);
const kd0d0d0 = Color(0xFFd0d0d0);
const kdddddd = Color(0xFFdddddd);
const k343434 = Color(0xFF343434);
const k171717 = Color(0xFF171717);
const kfff8f9 = Color(0xFFFFF8F9);
const kFF7038 = Color(0xFFFF7038);
const gradientColor = [Color(0xFFF3495B), Color(0xFFF1874D)];

// longitude
double kLongitude = 0;
// latitude
double kLatitude = 0;

const MaterialColor kprimarySwatch = MaterialColor(
  0xFF005F9D,
  <int, Color>{
    50: Color(0xFF005F9D),
    100: Color(0xFF005F9D),
    200: Color(0xFF005F9D),
    300: Color(0xFF005F9D),
    400: Color(0xFF005F9D),
    500: Color(0xFF005F9D),
    600: Color(0xFF005F9D),
    700: Color(0xFF005F9D),
    800: Color(0xFF005F9D),
    900: Color(0xFF005F9D),
  },
);
const kAgoraAppId = '28ea9ddb5683440e9010ce7fd2cfd444';
const kHost = "https://webservice.piepme.com/";
const kHostDev = 'https://webservicedev.piepme.com/';
const kHostPiepPay = "https://pay.piepme.com/";
const kHostUpload = 'https://media.piepme.com/';
const kKeyToken = "Piepme2017";
const kVersion = 1;
const kVersionToken = "v1";
const kDefaultAvatar = 'https://piepme.com/images/piep-avatar.png';
const kLocalDefaultAvatar = 'assets/images/piep-avatar.png';
const kShareLink = 'https://piepme.com/';
const kDefaultThumb =
    "https://cdn.piepme.com/6402/images/piep-qsGFDd6G16482772396771648277239677.jpg";
const kDefaultProfileBG =
    "https://cdn.piepme.com/6402/images/piep-eewPndWX16482772077081648277207708.jpg";
const kTagHeroAnimation = "heroAnimation";
const klastLoginTime = 'lastLoginTime';
const kSticker = 'sticker';
const kIsVideoAutoPlay = 'isVideoAutoPlay';
const kTransactionKey = 'transactionKey';
const kTimeLoadFriend = 'TimeLoadFriendHis';

const kLimit = 15;
List<N100Model> kListCommentCompany = [];

const kFontQuickSand = 'Quicksand';
const kFontBoogaloo = 'Boogaloo';
const kFontOpenSans = 'Open Sans';
const kFontBeVietNamPro = 'BeVietNamPro';
const kFontBeVietNamProItaclic = 'BeVietNamPro Italic';

const kQBKeyword = "##qb##";

String lastTagDetailPieper = '';

const kDateTimeLocale = {
  'vi': 'vi_VN',
  'en': 'en_US',
  'de': 'de_DE',
};

const kNodeDemoTungNS = 'DemoTungns';
const kNodeL200S = 'l200s';
const kAlertPhotoVideo = 'alert_photo_video';
const kAlertMicroCamera = 'alert_micro_camera';

AudioPlayer? currentAudioPlayer;
VideoPlayerController? currentVideoPlayer;

String currentIndexScroll = "Home1";

Map<String, int> dataIndexScroll = {
  "Home1": 0,
  "Channel": 1,
  "PiepAndCall": 2,
  "Profile": 3,
};

const kPiepMeTermUrl = 'https://piepme.com/pm-term';
const kPiepMePrivacyUrl = 'https://piepme.com/pm-privacy';
const kPiepMeGuideUrl = 'https://piepme.com/guide-game';

const int specialFO100MUSIC = 14977;
const int specialFO100VNBG = 14789;
const int specialFO100AUCTION = 17163;
const int specialFO100CHANNELMUSIC = 17739;

const kAESKey = "mK9J3R6L4uKmVxLE";
const kAESIv = "mK9J3R6L4uKmVxLE";
const kAESDefaultKey = "fjk393shs323fh2j";
const kAESDefaultIv = "zxcmjasdhksahd33";

// chat
const kChatGroupDateFormat = "yyyy-MM-dd";
const kMessageMaxScreenWidth = 2 / 3;
const kSpecialFM200s = [21934];
const kFO100Admin = 1414;
const kMessengerClientNode = 'messenger_Client';
const kSendNode = 'send';
const kReceiveNode = 'receive';
const kUsersNode = 'users';
const kInfoNode = '.info';
const kConnectedNode = 'connected';
const kGroupsNode = 'GROUPS';
const kFO100Node = 'FO100';
const kFM400Node = 'FM400';
const kReceiveMessageFirebase = "RECEIVEMESSAGEFIREBASE";
const kChatGroupCreated = "CHATGROUPCREATED";
const kReceiveCall = "RECIVECALL";
const kEndCall = "ENDCALL";
const kReceiveDeleteUserInListFriend = "receiveDeleteUserInListFriend";
const kLixiOTPConfirmed = "lixiOTPConfirmed";

// ALTP
const kLinkBGAudioALTP =
    'https://cdn.piepme.com/19497/sound/piep-hBPa8JYH16257180719461625718071946.mp3';
