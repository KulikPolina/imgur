import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:images/src/bloc/images_cubit.dart';
import 'package:images/src/bloc/images_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:navigation/navigation.dart';

import 'image_cubit_test.mocks.dart';

class MockRouter extends Mock implements StackRouter {}

@GenerateMocks([
  LoadPostsUseCase,
  CheckFavouritesUseCase,
])
void main() {
  group('ImageBloc text', () {
    final MockLoadPostsUseCase loadPostsUseCase = MockLoadPostsUseCase();
    final MockCheckFavouritesUseCase checkFavouritesUseCase =
        MockCheckFavouritesUseCase();

    blocTest<ImagesCubit, ImagesState>(
      'test error state',
      build: () {
        when(loadPostsUseCase.execute(any)).thenThrow(Exception());
        return ImagesCubit(
          AppRouter(),
          loadPostsUseCase,
          checkFavouritesUseCase,
        );
      },
      act: (ImagesCubit bloc) {
        bloc.loadPage(0);
      },
      expect: () => [
        //isA<ImagesLoadingState>(),
        isA<ImagesLoadingErrorState>(),
      ],
    );

    blocTest<ImagesCubit, ImagesState>(
      'test loaded state',
      build: () {
        when(loadPostsUseCase.execute(any)).thenAnswer(
            (_) => Future<GalleryModel>.value(const GalleryModel(posts: [])));

        return ImagesCubit(
          AppRouter(),
          loadPostsUseCase,
          checkFavouritesUseCase,
        );
      },
      act: (ImagesCubit bloc) {},
      expect: () => [isA<ImagesLoadedState>()],
    );
  });
}
