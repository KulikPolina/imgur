import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('favourite mapping test when images is empty', () {
    final List<PostModel> post = <PostModel>[
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: false,
      ),
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: false,
      ),
    ];

    final List<PostModel> favourite = <PostModel>[
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: true,
      ),
    ];

    final List<PostModel> result = FavouritesMapper.map(
      FavouritesMapperArguments(
        post,
        favourite,
      ),
    );

    expect(result.isEmpty, true);
  });

  test('favourite mapping test when images is now empty', () {
    final List<PostModel> post = <PostModel>[
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: [
          ImageModel(
            id: '1',
            title: 'title',
            description: 'description',
            datetime: DateTime.now().microsecondsSinceEpoch,
            link: 'link',
          ),
        ],
        isFavourite: false,
      ),
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: false,
      ),
    ];

    final List<PostModel> favourite = <PostModel>[
      PostModel(
        id: '0',
        title: 'title 1',
        description: 'description 1',
        datetime: DateTime.now().microsecondsSinceEpoch,
        images: List<ImageModel>.empty(),
        isFavourite: true,
      ),
    ];

    final List<PostModel> result = FavouritesMapper.map(
      FavouritesMapperArguments(
        post,
        favourite,
      ),
    );

    expect(result.length, 1);
  });
}
