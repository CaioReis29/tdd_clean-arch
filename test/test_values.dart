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
  copyright: "Daniel Korona",
  date: DateTime.parse("2024-04-12"),
  explanation: "Baily's beads often appear at the boundaries of the total phase of an eclipse of the Sun. Pearls of sunlight still beaming through gaps in the rugged terrain along the lunar limb silhouette, their appearance is recorded in this dramatic timelapse composite. The series of images follows the Moon's edge from beginning through the end of totality during April 8's solar eclipse from Durango, Mexico. They also capture pinkish prominences of plasma arcing high above the edge of the active Sun. One of the first places in North America visited by the Moon's shadow on April 8, totality in Durango lasted about 3 minutes and 46 seconds.   Solar Eclipse Imagery: Notable Submissions to APOD",
  hdurl: "https://apod.nasa.gov/apod/image/2404/image0tseKorona.jpg",
  mediaType: "image",
  serviceVersion: "v1",
  title: "Total Totality",
  url: "https://apod.nasa.gov/apod/image/2404/image0tseKorona_1100.jpg",
);