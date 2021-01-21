import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:state_mgmt/domain/repository/user_repository.dart';
import 'package:state_mgmt/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:state_mgmt/presentation/bloc/login/login_bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

void main() {
  LoginBloc loginBloc;
  MockUserRepository userRepository;
  MockAuthenticationBloc authenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = MockAuthenticationBloc();
    loginBloc = LoginBloc(
      userRepository: userRepository,
      authenticationBloc: authenticationBloc,
    );
  });

  tearDown(() {
    loginBloc?.close();
    authenticationBloc?.close();
  });

  test('initial state is correct', () {
    expect(LoginInitial(), loginBloc.initialState);
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([LoginInitial(), emitsDone]),
    );
    loginBloc.close();
  });

  group('LoginButtonPressed', () {
    test('emits token on success', () {
      final expectedResponse = [
        LoginInitial(),
        LoginInProgress(),
        LoginInitial(),
      ];

      when(userRepository.authenticate(
        email: 'valid.email',
        password: 'valid.password',
      )).thenAnswer((_) => Future.value('token'));

      expectLater(
        loginBloc,
        emitsInOrder(expectedResponse),
      ).then((_) {
        verify(authenticationBloc.add(AuthenticationLoggedIn(token: 'token')))
            .called(1);
      });

      loginBloc.add(LoginButtonPressed(
        email: 'valid.email',
        password: 'valid.password',
      ));
    });
  });

  group('LoginButtonPressed using bloc_test', () {
    blocTest(
      'emits [LoginLoading, LoginInitial] and token on success',
      build: () async {
        when(userRepository.authenticate(
          email: 'valid.email',
          password: 'valid.password',
        )).thenAnswer((_) => Future.value('token'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(
        LoginButtonPressed(
          email: 'valid.email',
          password: 'valid.password',
        ),
      ),
      expect: [
        LoginInProgress(),
        LoginInitial(),
      ],
      verify: (_) async {
        verify(authenticationBloc.add(AuthenticationLoggedIn(token: 'token')))
            .called(1);
      },
    );
  });
}
