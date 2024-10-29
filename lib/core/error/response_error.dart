

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_error.g.dart';

@JsonSerializable()
class ResponseError implements Exception{

  ResponseError({
    required this.errorStatus,
  });
  @JsonKey(name: "message")
  final String errorStatus;

  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);

  static const fromJsonFactory = _$ResponseErrorFromJson;


  @override
  String toString(){
    return errorStatus;
  }
}



