// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) => Actions(
  canCall: json['can_call'] as bool?,
  canChat: json['can_chat'] as bool?,
);

Map<String, dynamic> _$ActionsToJson(Actions instance) => <String, dynamic>{
  'can_call': instance.canCall,
  'can_chat': instance.canChat,
};
