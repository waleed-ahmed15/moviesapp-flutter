import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/models/movies_video_model.dart';
import 'package:moviesapp/utils/app_constants.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late MoviesController moviesController;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    moviesController = MoviesController(client: mockHTTPClient);
  });

  group('MoviesControllerTest -', () {
    group('get movie videos', () {
      test('get movie videos test when movie id is given and response is 200',
          () async {
        const moviesId = '60565';
        when(() => mockHTTPClient.get(
                Uri.parse('${AppConstants.baseURL}/3/movie/$moviesId/videos')))
            .thenAnswer((invocation) async {
          return Future.value(Response(
            '''
              {
    "id": 60565,
    "results": [
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Coroner Creek   Original Trailer",
            "key": "ezJpssqTZIg",
            "published_at": "2013-01-02T16:02:07.000Z",
            "site": "YouTube",
            "size": 360,
            "type": "Trailer",
            "official": false,
            "id": "57840e8492514121b70017c2"
        }
    ]
}
            ''',
            200,
          ));
        });

        final movieVideos = await moviesController.getMovieVideos(moviesId);
        expect(movieVideos, isA<MovieVideosModel>());
      });
    });
  });
}
