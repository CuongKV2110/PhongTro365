// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      owner: json['owner'] as String,
      people: json['people'] as String,
      acreage: json['acreage'] as String,
      cost: json['cost'] as String,
      location: json['location'] as String,
      phone: json['phone'] as String,
      water: json['water'] as String,
      electricity: json['electricity'] as String,
      internet: json['internet'] as String,
      wifi: json['wifi'] as bool,
      wc: json['wc'] as bool,
      time: json['time'] as bool,
      vehicle: json['vehicle'] as bool,
      kitchen: json['kitchen'] as bool,
      fridge: json['fridge'] as bool,
      washing: json['washing'] as bool,
      conditioning: json['conditioning'] as bool,
      content: json['content'] as String,
      imgUrl: json['imgUrl'] as String,
      postID: json['postID'] as String,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'owner': instance.owner,
      'people': instance.people,
      'acreage': instance.acreage,
      'cost': instance.cost,
      'location': instance.location,
      'phone': instance.phone,
      'water': instance.water,
      'electricity': instance.electricity,
      'internet': instance.internet,
      'wifi': instance.wifi,
      'wc': instance.wc,
      'time': instance.time,
      'vehicle': instance.vehicle,
      'kitchen': instance.kitchen,
      'fridge': instance.fridge,
      'washing': instance.washing,
      'conditioning': instance.conditioning,
      'content': instance.content,
      'imgUrl': instance.imgUrl,
      'postID': instance.postID,
    };