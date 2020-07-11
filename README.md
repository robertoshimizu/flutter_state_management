# Flutter Login Tutorial

Login Flow in Flutter using the Bloc library.

## Dependencies

* flutter_bloc
* bloc_test

## VSCode Extension

Provides tools for creating blocs
* bloc by Felix Angelov

## Authentication States

A user's authentication state can be one of the following:

* AuthenticationInitial - waiting to see if the user is authenticated or not on app start.
* AuthenticationInProgress - waiting to persist/delete a token
* AuthenticationSuccess - successfully authenticated
* AuthenticationFailure - not authenticated

Each of these states will have an implication on what the user sees. For example:

* if the authentication state was AuthenticationInitial, the user might be seeing a splash screen.
* if the authentication state was AuthenticationInProgress, the user might be seeing a progress indicator.
* if the authentication state was AuthenticationSuccess, the user might see a home screen.
* if the authentication state was AuthenticationFailure, the user might see a login form.

It's critical to identify what the different states are going to be before diving into the implementation.

## Authentication Events

Now that we have our AuthenticationState defined we need to define the AuthenticationEvents which our AuthenticationBloc will be reacting to.

We will need:

* an AuthenticationStarted event to notify the bloc that it needs to check if the user is currently authenticated or not.
* an AuthenticationLoggedIn event to notify the bloc that the user has successfully logged in.
* an AuthenticationLoggedOut event to notify the bloc that the user has successfully logged out.









A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
