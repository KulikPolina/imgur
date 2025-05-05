import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../entities/entities.dart';
import '../../exceptions/exceptions.dart';
import '../providers.dart';

class CustomAuthProviderImpl implements AuthorizationProvider {

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
        final Response<dynamic> response = await _dio.post('');

        return UserEntity.fromJson(response.data as Map<String, dynamic>);
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
        final Response<dynamic> responseUser = await _dio.get('');
        _user = UserEntity.fromJson(responseUser.data as Map<String, dynamic>);

        return _user;
      },
    );
  }

  

  @override
  Future<UserEntity?> getCurrentUser() async {
    //TODO: Change
    return _user; 
  }

  @override
  Future<void> signOut() async {
    await _storage.deleteAll();
    _user = null;
  }
}
