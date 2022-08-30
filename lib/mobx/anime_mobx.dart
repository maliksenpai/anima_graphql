import 'package:anima_graphql/data/anime_data.dart';
import 'package:anima_graphql/model/anime.dart';
import 'package:mobx/mobx.dart';

part 'anime_mobx.g.dart';

class AnimeMobx = _AnimeMobx with _$AnimeMobx;

abstract class _AnimeMobx with Store{

  @observable
  List<Anime> animes = [];

  @observable
  bool loading = false;
  int page = 1;

  @action
  Future getAnimes() async {
    List<Anime> newAnimes = [...animes];
    loading = true;
    newAnimes.addAll(await AnimeData().getAnimeList(page));
    animes = newAnimes;
    loading = false;
    page++;
  }
}