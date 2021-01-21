import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:state_mgmt/domain/repository/user_repository.dart';
import 'package:state_mgmt/presentation/bloc/authentication/authentication_bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  tearDown(() {
    authenticationBloc?.close();
  });

  group('Initial State', () {
    test('initial state is correct', () {
      expect(authenticationBloc.initialState, AuthenticationInitial());
      // We are comparing two instances of AuthenticationState,
      // that's why we need Equatable
    });

    test('close does not emit new states', () {
      expectLater(
        authenticationBloc,
        emitsInOrder([AuthenticationInitial(), emitsDone]),
      );
      authenticationBloc.close();
    });
  });

  group('LoggedIn', () {
    test('emits [initial, inProgress, success] when token is persisted', () {
      final expectedResponse = [
        AuthenticationInitial(),
        AuthenticationInProgress(),
        AuthenticationSucess(),
      ];
      expectLater(
        authenticationBloc,
        emitsInOrder(expectedResponse),
      );
      authenticationBloc.add(AuthenticationLoggedIn(
        token: 'instance.token',
      ));
    });
  });

  group('LoggedOut', () {
    test('emits [initial, inProgress, failure] when token is deleted', () {
      final expectedResponse = [
        AuthenticationInitial(),
        AuthenticationInProgress(),
        AuthenticationFailure(),
      ];

      expectLater(
        authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      authenticationBloc.add(AuthenticationLoggedOut());
    });
  });

  group('AppStarted', () {
    test('emits [initial, failure] for invalid token', () {
      final expectedResponse = [
        AuthenticationInitial(),
        AuthenticationFailure(),
      ];

      when(userRepository.hasToken()).thenAnswer((_) => Future.value(false));

      expectLater(
        authenticationBloc,
        emitsInOrder(expectedResponse),
      );
      authenticationBloc.add(AuthenticationStarted());
    });
  });
}
