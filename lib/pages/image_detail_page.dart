import 'package:anima_graphql/model/anime.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends StatelessWidget {
  final Anime anime;
  const ImageDetailPage({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(anime.title),),
      body: SafeArea(
        child: Hero(
          tag: anime.id,
          child: Center(
            child: PhotoView(
              imageProvider: NetworkImage(anime.coverImages.first),
            ),
          ),
        ),
      ),
    );
  }
}
