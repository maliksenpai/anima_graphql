class Anime {
  late int id;
  late String title;
  late String description;
  late List<String> genres;
  late List<String> coverImages;
  late int? episodes;

  Anime({required this.id,
    required this.title,
    required this.description,
    required this.genres,
    required this.coverImages,
    required this.episodes});

  Anime.fromGraphql(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title']['userPreferred'],
        description = json['description'],
        genres = json['genres'].map((element) => element.toString())
            .toList()
            .cast<String>(),
        coverImages = [
          json['coverImage']['extraLarge'],
          json['coverImage']['medium']
        ],
        episodes = json['episodes'];


}

