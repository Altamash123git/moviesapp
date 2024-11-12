import 'package:flutter/material.dart';
import 'package:moviesapp/models/static_movie_model.dart' as model;

class MovieDetailPage extends StatelessWidget {
  final model.moviesData movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.show?.name ?? "Movie Details"),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.show?.image?.original != null)
              Image.network(
                movie.show!.image!.original!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.show?.name ?? "No Title",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Language: ${movie.show?.language ?? 'N/A'}",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Genres: ${movie.show?.genres?.join(', ') ?? 'N/A'}",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rating: ${movie.show?.rating?.average?.toString() ?? 'N/A'}",
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Premiered: ${movie.show?.premiered ?? 'N/A'}",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Summary:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    movie.show?.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                        'No Summary Available',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
