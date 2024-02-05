import 'package:mockito/mockito.dart';
import 'package:test_unit/test.dart';

const _userName = 'purushotam';
const _password = 'password';
const _newUser = true;

class MockUserManager extends Mock implements UserManager {
  // This gets called for result1
  Future<LoginErrorEvent?> validateCredentials({
    final String? userName,
    final String? password,
    final bool? newUser,
  }) async {
    const value = null;
    print('This is for result1 Call returning $value');
    return value;
  }
}

void main() async {
  final userManager = MockUserManager();
  final result1 = await userManager.validateCredentials(
    userName: _userName,
    password: _password,
    newUser: _newUser,
  );
  print(result1); // <= This goes inside mock method and prints null

  final test = Test(userManager);

  final result2 = await test.startTest();

  print(result2); // <= This goes inside real userManager class and prints error
}
