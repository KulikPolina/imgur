import '../enums/enums.dart';

class GetPostsPayload {
  final int page;
  final SectionEnum sectionEnum;
  final SortEnum sortEnum;
  final WindowEnum windowEnum;

  GetPostsPayload(
    this.page,
    this.sectionEnum,
    this.sortEnum,
    this.windowEnum,
  );

  factory GetPostsPayload.initial() {
    return GetPostsPayload(
      0,
      SectionEnum.hot,
      SortEnum.viral,
      WindowEnum.day,
    );
  }

  factory GetPostsPayload.fromPage({required int page}) {
    return GetPostsPayload(
      page,
      SectionEnum.hot,
      SortEnum.viral,
      WindowEnum.day,
    );
  }
}
