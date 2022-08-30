import 'package:anima_graphql/mobx/anime_mobx.dart';
import 'package:anima_graphql/model/anime.dart';
import 'package:anima_graphql/pages/anime_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListAnimesPage extends StatefulWidget {
  const ListAnimesPage({Key? key}) : super(key: key);

  @override
  State<ListAnimesPage> createState() => _ListAnimesPageState();
}

class _ListAnimesPageState extends State<ListAnimesPage> {
  final AnimeMobx animeMobx = AnimeMobx();
  ScrollController scrollController = ScrollController();
  bool loading = false;

  @override
  void initState() {
    animeMobx.getAnimes();
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange && !loading) {
        setState(() {
          loading = true;
        });
        animeMobx.getAnimes().whenComplete(() => {
          setState(() {
            loading = false;
          })
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Animes"),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (animeMobx.loading && animeMobx.animes.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!animeMobx.loading && animeMobx.animes.isEmpty) {
              return const Center(
                child: Text("There is no anime, sorry :("),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: animeMobx.animes.length,
                      itemBuilder: (context, index) {
                        Anime anime = animeMobx.animes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AnimeDetailPage(
                                    anime: anime,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Hero(
                                      tag: anime.id,
                                      child: CachedNetworkImage(
                                        imageUrl: anime.coverImages.last,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.2,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SelectableText(
                                          anime.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          anime.description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (loading) const CircularProgressIndicator()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
