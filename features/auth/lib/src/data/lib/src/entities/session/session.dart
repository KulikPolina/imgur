import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

// TODO(CustomProvider): Modify to fit your session model
@freezed
class Session with _$Session {
  const factory Session({required String id}) = _Session;

  factory Session.fromJson(Map<String, Object?> json) => _$SessionFromJson(json);
}
