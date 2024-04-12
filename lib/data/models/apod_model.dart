
import 'package:tdd_clean_arch/domain/entities/apod.dart';

class ApodModel extends Apod{
  const ApodModel({
    super.copyright,
    super.date,
    super.explanation,
    super.mediaType,
    super.serviceVersion,
    super.title,
    super.url,
    super.hdurl,
    super.thumbnailUrl,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
    copyright: json['copyright'] ?? "NASA APOD",
    date: json['date'],
    explanation: json['explanation'],
    mediaType: json['mediaType'],
    serviceVersion: json['serviceVersion'],
    title: json['title'],
    url: json['url'],
    hdurl: json['hdurl'],
    thumbnailUrl: json['thumbnailUrl'],
  );

  Map<String, dynamic> toJson() => {
    'copyright': copyright,
    'date': date,
    'explanation': explanation,
    'mediaType': mediaType,
    'serviceVersion': serviceVersion,
    'title': title,
    'url': url,
    'hdurl': hdurl,
    'thumbnailUrl': thumbnailUrl,
  };
}