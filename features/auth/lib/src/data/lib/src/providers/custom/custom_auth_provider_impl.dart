import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../entities/entities.dart';
import '../../exceptions/exceptions.dart';
import '../providers.dart';

class CustomAuthProviderImpl implements AuthorizationProvider {
  //This is key for writing sessionId to secure storage map;
  static const String _sessionIdKey = 'sessionId';

  final Dio _dio;
  final FlutterSecureStorage _storage;
  final ExceptionsHandler _customExceptionHandler;
  UserEntity? _user;

  CustomAuthProviderImpl({
    required Dio dio,
    required FlutterSecureStorage storage,
    required ExceptionsHandler customExceptionHandler,
  })  : _dio = dio,
        _storage = storage,
        _customExceptionHandler = customExceptionHandler;

  @override
  Future<UserEntity?> signUpWithCredentials({
    required SignUpPayloadEntity signUpPayloadEntity,
  }) async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        final Response response = await _dio.post('');
        _user = UserEntity.fromJson(response.data as Map<String, dynamic>);

        return _user;
      },
    );
  }

  @override
  Future<UserEntity?> signInWithCredentials({
    required SignInPayloadEntity signInPayloadEntity,
  }) async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        // TODO(CustomProvider): Replace with the actual request
        final Response responseUser = await _dio.get('');
        _user = UserEntity.fromJson(responseUser.data as Map<String, dynamic>);

        // TODO(CustomProvider): Replace with the actual request
        final Response responseSessionId = await _dio.get('');
        final Session session = Session.fromJson(responseSessionId.data as Map<String, dynamic>);

        await _storage.write(key: _sessionIdKey, value: session.id);

        return _user;
      },
    );
  }

  @override
  Future<UserEntity?> signInWithSessionId() async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        Map<String, String> sessions = await _storage.readAll();
        final String? sessionId = sessions[_sessionIdKey];

        if (sessionId == null) {
          throw UserNotSignedInAuthException();
        }
        // TODO(CustomProvider): Replace with the actual request
        final Response responseUser = await _dio.get('');
        _user = UserEntity.fromJson(responseUser.data as Map<String, dynamic>);

        return _user;
      },
    );
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    return _user ?? await signInWithSessionId();
  }

  @override
  Future<void> signOut() async {
    await _storage.deleteAll();
    _user = null;
  }
}
