import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:spaplex/model/user.dart';
import 'package:spaplex/repository/product_repository.dart';
import 'package:spaplex/repository/user_repository.dart';
import 'package:spaplex/response/get_product_response.dart';

void main() {
  UserRepository? userRepository;
  ProductResponse? productResponse;
  ProductRepository? productRepository;
  Box box;
  setUp(() {
    userRepository = UserRepository();
  });
  group('User API test', () {
    test('User Registration', () async {
      bool expectedValue = true;
      User user = User(
        email: "test@gmail.com",
        username: "test",
        password: "test",
      );
      bool actualResult = await UserRepository().registerUser(user);
      expect(actualResult, expectedValue);
    });
    test('User Login', () async {
      bool expectedValue = true;
      const email = "test@gmail.com";
      const password = "test";

      bool actualResult = await UserRepository().login(email, password);
      expect(actualResult, expectedValue);
    });
    test('User', () async {
      bool expectedValue = true;
      const email = "testuser@gmail.com";
      const password = "test";

      bool actualResult = await UserRepository().login(email, password);
      expect(actualResult, expectedValue);
    });
  });

  tearDown(() {
    userRepository = null;
  });
}
