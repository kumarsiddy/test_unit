class UserManager {}

enum LoginErrorEvent {
  error,
}

extension UserManagerX on UserManager {
  // This gets called for result2
  Future<LoginErrorEvent?> validateCredentials({
    final String? userName,
    final String? password,
    final bool? newUser,
  }) async {
    const value = LoginErrorEvent.error;
    print('This is for result2 Call returning $value');
    return value;
  }
}

const _userName = 'purushotam';
const _password = 'password';
const _newUser = true;

class Test {
  final UserManager _userManager;

  Test(this._userManager);

  Future<LoginErrorEvent?> startTest() async {
    // While testing this calls real method instead of calling
    // mock class's method
    final result = await _userManager.validateCredentials(
      userName: _userName,
      password: _password,
      newUser: _newUser,
    );

    return result;
  }
}
