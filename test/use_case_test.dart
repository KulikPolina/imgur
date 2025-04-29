import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'use_case_test.mocks.dart';

@GenerateMocks([
  LocalFavouritesRepository,
])
void main() {
  test(
    'AddToFavouritesUseCase test',
    () {
      final MockLocalFavouritesRepository mockRepository =
          MockLocalFavouritesRepository();
      final AddToFavouritesUseCase useCase =
          AddToFavouritesUseCase(mockRepository);
      final PostModel model = PostModel(
        id: 'id',
        title: 'title',
        description: 'description',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: false,
      );

      useCase.execute(model);

      final VerificationResult verification = verify(
        mockRepository.addToFavourite(
          favourite: captureAnyNamed('favourite'),
        ),
      );

      expect(verification.captured[0] == model, true);
    },
  );

  test('GetAllFavouritesUseCase test', () async {
    final MockLocalFavouritesRepository mockRepository =
        MockLocalFavouritesRepository();

    final GetAllFavouritesUseCase useCase =
        GetAllFavouritesUseCase(mockRepository);

    final PostModel model = PostModel(
      id: 'id',
      title: 'title',
      description: 'description',
      datetime: DateTime.now().microsecondsSinceEpoch,
      images: List<ImageModel>.empty(),
      isFavourite: false,
    );

    when(mockRepository.getFavourites()).thenAnswer(
      (_) => Future<List<PostModel>>.value(<PostModel>[model]),
    );

    final List<PostModel> result = await useCase.execute();
    expect(model == result[0], true);
  });
}
