import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/models/movies_details_model.dart';
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
                Uri.parse('${AppConstants.baseURL}/3/movie/$moviesId/videos'),
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': AppConstants.token
                })).thenAnswer((invocation) async {
          return Response(
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
          );
        });

        final movieVideos = await moviesController.getMovieVideos(moviesId);
        expect(movieVideos, isA<MovieVideosModel>());
      });

      test(
          'when response status code is not 200 for get movies method',
          () => {
                when(() => mockHTTPClient
                        .get(
                            Uri.parse(
                                '${AppConstants.baseURL}/3/movie/60565/videos'),
                            headers: {
                          'Content-Type': 'application/json',
                          'Authorization': AppConstants.token
                        })).thenAnswer((invocation) async {
                  return Response('{}', 404);
                })
              });
    });

    // test case for whne response is not 200 for get movie videos
  });
  group('get movie details by movie id ', () {
    test('when response status code is 200 for get movie details by movie id',
        () async {
      const moviesId = '60565';
      when(() => mockHTTPClient.get(
              Uri.parse('${AppConstants.baseURL}/3/movie/$moviesId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': AppConstants.token
              })).thenAnswer((invocation) async {
        return Response(
          '''
              {
    "adult": false,
    "backdrop_path": "/9hYS11ieIDmq871Z6yVKU1stcf1.jpg",
    "belongs_to_collection": null,
    "budget": 0,
    "genres": [
        {
            "id": 37,
            "name": "Western"
        }
    ],
    "homepage": "",
    "id": 60565,
    "imdb_id": "tt0040245",
    "original_language": "en",
    "original_title": "Coroner Creek",
    "overview": "A man is bent on taking revenge on those responsible for his fiancée's death.",
    "popularity": 2.996,
    "poster_path": "/vNuIDlaJhF6omwLBvOumasRwZp7.jpg",
    "production_companies": [
        {
            "id": 13622,
            "logo_path": null,
            "name": "Producers-Actors Corporation",
            "origin_country": ""
        },
        {
            "id": 5,
            "logo_path": "/71BqEFAF4V3qjjMPCpLuyJFB9A.png",
            "name": "Columbia Pictures",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1948-07-01",
    "revenue": 0,
    "runtime": 90,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "Brutal! Breathtaking Drama!",
    "title": "Coroner Creek",
    "video": false,
    "vote_average": 6.0,
    "vote_count": 24
}
            ''',
          200,
        );
      });

      final movieVideos = await moviesController.getMovieDetails(moviesId);
      expect(movieVideos, isA<MovieDetailsModel>());
    });

    // when response status code is not 200 for get movie details by movie id
    test(
        'when response status code is not 200 for get movie details by movie id',
        () => {
              when(() => mockHTTPClient.get(
                      Uri.parse('${AppConstants.baseURL}/3/movie/60565'),
                      headers: {
                        'Content-Type': 'application/json',
                        'Authorization': AppConstants.token
                      })).thenAnswer((invocation) async {
                return Response('{}', 404);
              })
            });
  });
}
