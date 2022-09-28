// To parse this JSON data, do
//
//     final quizListModel = quizListModelFromJson(jsonString);

import 'dart:convert';

List<QuizListModel> quizListModelFromJson(String str) =>
    List<QuizListModel>.from(
        json.decode(str).map((x) => QuizListModel.fromJson(x)));

String quizListModelToJson(List<QuizListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizListModel {
  QuizListModel({
    this.questionNo,
    this.type,
    this.duration,
    this.points,
    this.questionTitle,
    this.mediaType,
    this.options,
    this.advanceSetting,
  });

  int? questionNo;
  String? type;
  String? duration;
  int? points;
  String? questionTitle;
  String? mediaType;
  List<Option>? options;
  AdvanceSetting? advanceSetting;

  factory QuizListModel.fromJson(Map<String, dynamic> json) => QuizListModel(
        questionNo: json["questionNo"] ?? null,
        type: json["type"] ?? null,
        duration: json["duration"] ?? null,
        points: json["points"] ?? null,
        questionTitle: json["questionTitle"] ?? null,
        mediaType: json["mediaType"] ?? null,
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        advanceSetting: AdvanceSetting.fromJson(json["advanceSetting"]),
      );

  Map<String, dynamic> toJson() => {
        "questionNo": questionNo ?? null,
        "type": type ?? null,
        "duration": duration ?? null,
        "points": points ?? null,
        "questionTitle": questionTitle ?? null,
        "mediaType": mediaType ?? null,
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "advanceSetting":
            advanceSetting == null ? null : advanceSetting!.toJson(),
      };
}

class AdvanceSetting {
  AdvanceSetting({
    this.feedback,
    this.negitivePoints,
    this.isSkip,
  });

  String? feedback;
  int? negitivePoints;
  bool? isSkip;

  factory AdvanceSetting.fromJson(Map<String, dynamic> json) => AdvanceSetting(
        feedback: json["feedback"] ?? null,
        negitivePoints: json["negitivePoints"] ?? null,
        isSkip: json["isSkip"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "feedback": feedback ?? null,
        "negitivePoints": negitivePoints ?? null,
        "isSkip": isSkip ?? null,
      };
}

class Option {
  Option({
    this.option1,
    this.option2,
  });

  String? option1;
  String? option2;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        option1: json["option1"] == null ? null : json["option1"],
        option2: json["option2"] == null ? null : json["option2"],
      );

  Map<String, dynamic> toJson() => {
        "option1": option1 == null ? null : option1,
        "option2": option2 == null ? null : option2,
      };
}
