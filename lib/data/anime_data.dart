import 'package:anima_graphql/model/anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';

final _httpLink = HttpLink(
  'https://graphql.anilist.co/',
);

const String animeRequest = r'''
query getAnime($page: Int!, $perPage: Int!){
  Page(page: $page, perPage: $perPage) {
    media {
      id
      title {
        userPreferred
      }
      status
      description
      genres
      episodes
      coverImage {
        extraLarge
        large
        medium
        color
      }
    }
  }
}

''';

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: _httpLink,
);

class AnimeData{
  static const int _perPage = 20;

  Future<List<Anime>> getAnimeList(int page) async {
    final QueryOptions options = QueryOptions(
      document: gql(animeRequest),
      variables: <String, dynamic>{
        'page': page,
        'perPage': _perPage
      },
    );
    List<Anime> list = [];
    try{
      final QueryResult result = await client.query(options);
      result.data!['Page']!['media'].forEach((item) {
        list.add(Anime.fromGraphql(item));
      });
    } catch(e){
      debugPrint(e.toString());
      throw e.toString();
    }

    return list;
  }

}