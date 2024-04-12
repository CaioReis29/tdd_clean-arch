import 'package:tdd_clean_arch/core/failure.dart';
import 'package:tdd_clean_arch/data/models/apod_model.dart';
import 'package:tdd_clean_arch/domain/entities/apod.dart';

Apod Function() tApod = () => Apod(
  copyright: "Stefan Seip",
  date: DateTime.parse("2004-09-27"),
  explanation: "The Great Nebula in Orion is a colorful place.",
  mediaType: "image",
  serviceVersion: "v1",
  title: "The Great Nebula in Orion",
  url: "https://apod.nasa.gov/apod/image/0409/orion_seip_jpg",
  hdurl: "https://apod.nasa.gov/apod/image/0409/orion_seip_big_jpg",
);

Failure Function() noConnection = () => NoConnection();

ApodModel Function() tApodModel = () => ApodModel(
  copyright: "Stefan Seip",
  date: DateTime.parse("2004-09-27"),
  explanation: "The Great Nebula in Orion is a colorful place.",
  mediaType: "image",
  serviceVersion: "v1",
  title: "The Great Nebula in Orion",
  url: "https://apod.nasa.gov/apod/image/0409/orion_seip_jpg",
  hdurl: "https://apod.nasa.gov/apod/image/0409/orion_seip_big_jpg",
);