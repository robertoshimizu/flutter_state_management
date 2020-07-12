import 'package:flutter_test/flutter_test.dart';
import 'package:state_mgmt/presentation/bloc/authentication/authentication_bloc.dart';

void main() {
  group('Authentication States', () {
    group('AuthenticationStates', () {
      test('props are []', () {
        expect(AuthenticationInitial().props, []);
      });
      test('props are []', () {
        expect(AuthenticationSucess().props, []);
      });
      test('props are []', () {
        expect(AuthenticationFailure().props, []);
      });
      test('props are []', () {
        expect(AuthenticationInProgress().props, []);
      });
    });
  });
}
