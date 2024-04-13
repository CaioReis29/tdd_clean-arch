import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_arch/data/datasources/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker internetChecker;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    internetChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetChecker: internetChecker);
  });

  test("should return true if you have an internet connection", () async {
    when(internetChecker.hasConnection).thenAnswer((_) async => true);

    final result = await networkInfo.isConnected;

    expect(result, true);
  });
  test("should return false if you don't have an internet connection", () async {
    when(internetChecker.hasConnection).thenAnswer((_) async => false);

    final result = await networkInfo.isConnected;

    expect(result, false);
  });
}