import 'package:anima_graphql/model/anime.dart';
import 'package:anima_graphql/pages/image_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AnimeDetailPage extends StatelessWidget {
  final Anime anime;

  const AnimeDetailPage({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: anime.id,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageDetailPage(
                          anime: anime,
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: anime.coverImages.first,
                    placeholder: (_, __) => CachedNetworkImage(
                      imageUrl: anime.coverImages.last,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.cover,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Wrap(
                children:
                    anime.genres.map((e) => Chip(label: Text(e))).toList(),
                spacing: 10,
              ),
              Text(
                anime.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (anime.episodes != null) const Divider(),
              if (anime.episodes != null) Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    const TextSpan(
                      text: 'Episodes\n',
                    ),
                    TextSpan(
                      text: anime.episodes.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Divider(),
              Html(data: anime.description)
            ],
          ),
        ),
      ),
    );
  }
}
