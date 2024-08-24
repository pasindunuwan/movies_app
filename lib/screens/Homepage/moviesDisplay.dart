import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

class moviesDisplayList extends StatelessWidget {
  final moveStage;
  final Future<List<MoviesModel>> function;

  const moviesDisplayList({
    super.key,
    required this.moveStage,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          moveStage,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          height: 5,
          thickness: 3,
          color: Colors.grey.shade300,
        ),
        FutureBuilder(
            future: function,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              List<MoviesModel> movies = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 125,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7))),
                                height: 100,
                                width: 250,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                      child: Image(
                                          width: 100,
                                          height: 150,
                                          fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                              movies[index].backdropPath)),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(movies[index]
                                                    .voteAvarage
                                                    .toString()),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(movies[index].title)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              );
            })
      ],
    );
  }
}
