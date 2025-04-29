import 'package:flutter/material.dart';

import '../../core.dart';

mixin PaginationMixin<T> on BlocBase<T> {
  final ScrollController paginationController = ScrollController();

  int _currentPage = 0;

  void initPagination({
    required ValueChanged<int> onLoad,
    int startPage = 0,
  }) {
    _currentPage = startPage;
    paginationController.addListener(
      () => _loadMoreItems(onLoad: onLoad),
    );
  }

  void disposePagination() {
    paginationController.dispose();
  }

  Future<void> _loadMoreItems({
    required ValueChanged<int> onLoad,
  }) async {
    final ScrollPosition scrollPosition = paginationController.position;

    if (scrollPosition.pixels == scrollPosition.maxScrollExtent) {
      onLoad.call(_currentPage);
      _currentPage += 1;
    }
  }
}
