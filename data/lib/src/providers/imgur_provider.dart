import 'package:core/core.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../entities/entities.dart';

part 'imgur_provider.g.dart';

@RestApi()
abstract class ImgurProvider {
  factory ImgurProvider(Dio dio, {String? baseUrl}) = _ImgurProvider;

  @GET(ApiConstants.galleryPath)
  @Headers(<String, String>{
    'Authorization': 'Client-ID $clientId',
  })
  Future<GalleryEntity> gallery(
    @Path('section') String section,
    @Path('sort') String sort,
    @Path('window') String window,
    @Path('page') int page,
  );

  @GET(ApiConstants.detailsPath)
  @Headers(<String, String>{
    'Authorization': 'Client-ID $clientId',
  })
  Future<DetailsEntity> details(
    @Path('id') String id,
  );

  @GET(ApiConstants.searchPath)
  @Headers(<String, String>{
    'Authorization': 'Client-ID $clientId',
  })
  Future<GalleryEntity> search(
    @Query('q') String query,
    @Path('sort') String sort,
    @Path('window') String window,
    @Path('page') int page,
  );
}
