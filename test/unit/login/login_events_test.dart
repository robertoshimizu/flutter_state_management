import 'package:flutter_test/flutter_test.dart';
import 'package:state_mgmt/login/login_bloc.dart';

void main() {
  group('LoginEvent: ', () {
    group('LoginButtonPressed: ', () {
      test('props are [email, password]', () {
        expect(LoginButtonPressed(email: 'email', password: 'password').props,
            ['email', 'password']);
      });
      test(
          'toString is '
          'LoginButtonPressed '
          '{ email: email, password: password }', () {
        expect(
          LoginButtonPressed(
            email: 'email',
            password: 'password',
          ).toString(),
          'LoginButtonPressed { email: email, password: password }',
        );
      });
    });
  });
}
