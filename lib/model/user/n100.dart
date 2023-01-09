import 'package:diacritic/diacritic.dart';
import 'package:get/state_manager.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class N100Model {

  /// id
  @JsonKey(name: 'PN100')
  int? pn100;

  /// username
  @JsonKey(name: 'NV101')
  String? nv101;

  /// password
  @JsonKey(name: 'NV102')
  String? nv102;

  /// email
  @JsonKey(name: 'NV103')
  String? nv103;

  /// token
  @JsonKey(name: 'NV104')
  String? nv104;

  /// first name
  @JsonKey(name: 'NV105')
  String? nv105;

  /// last name
  @JsonKey(name: 'NV106')
  String? nv106;

  /// Gender
  @JsonKey(name: 'NV107')
  String? nv107;

  /// year of birthday
  @JsonKey(name: 'NN108')
  int? nn108;

  /// language
  @JsonKey(name: 'NV109')
  String? nv109;

  /// avatar
  @JsonKey(name: 'NV110')
  String? nv110;

  /// date of create
  @JsonKey(name: 'NL111')
  DateTime? nl111;

  /// date of update
  @JsonKey(name: 'NL112')
  DateTime? nl112;


  N100Model({
    this.pn100,
    this.nv101,
    this.nv102,
    this.nv103,
    this.nv104,
    this.nv105,
    this.nv106,
    this.nv107,
    this.nn108,
    this.nv109,
    this.nv110,
    this.nl111,
    this.nl112
  });

  factory N100Model.fromJson(Map<String, dynamic> json) =>
      _$N100ModelFromJson(json);

  Map<String, dynamic> toJson() => _$N100ModelToJson(this);

  bool checkEmail() => (nv103 ?? '').isNotEmpty;

  String? getAvatar() => nv110 ?? '';

  String get getNV110 => (nv110 ??  '');

  N100Model get simplifiedUser => N100Model(
    pn100: pn100,
    nv101: nv101,
    nv110: getNV110
  );

  bool get isValidUser => (nv101 ?? '').isNotEmpty && (nv101 ?? '').isNotEmpty;

}
