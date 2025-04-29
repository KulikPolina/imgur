import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final AppRouter _appRouter;
  final GetAllFavouritesUseCase _getAllFavouritesUseCase;
  final ListenFavouritesUseCase _listenFavouritesUseCase;

  FavouritesCubit(
    this._appRouter,
    this._getAllFavouritesUseCase,
    this._listenFavouritesUseCase,
  ) : super(FavouritesLoadingState()) {
    _init();
  }

  late StreamSubscription<List<PostModel>> _favouritesListSubscription;

  Future<void> goToImageDetails(String id) async {
    await _appRouter.push<bool>(
      ImageDetailsRoute(id: id),
    );
  }

  Future<void> _init() async {
    final List<PostModel> favourites = await _getAllFavouritesUseCase.execute();

    _favouritesListSubscription = _listenFavouritesUseCase.execute().listen(
      (List<PostModel> favourites) {
        emit(
          favourites.isEmpty
              ? FavouritesEmptyState()
              : FavouritesLoadedState(favourites: favourites),
        );
      },
    );

    emit(
      favourites.isEmpty
          ? FavouritesEmptyState()
          : FavouritesLoadedState(favourites: favourites),
    );
  }

  void goToImages() {
    final AutoRoute mainRoute = _appRouter.routes[0];
    final AutoRoute imagesRoute = mainRoute.children!.routes.first;
    _appRouter.navigateNamed(imagesRoute.path);
  }

  @override
  Future<void> close() {
    _favouritesListSubscription.cancel();
    return super.close();
  }
}
