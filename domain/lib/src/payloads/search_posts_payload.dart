import '../enums/enums.dart';

class SearchPostsPayload {
  final String query;
  final int page;
  final SortEnum sortEnum;
  final WindowEnum windowEnum;

  const SearchPostsPayload({
    required this.query,
    this.page = 0,
    this.sortEnum = SortEnum.time,
    this.windowEnum = WindowEnum.all,
  });
}
