import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['name'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['image']?['original'] ?? 'https://via.placeholder.com/300'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(movie['summary'] ?? 'No summary available'),
                  SizedBox(height: 20),
                  // Display additional movie details if available
                  if (movie['genres'] != null) Text("Genres: ${movie['genres'].join(", ")}"),
                  if (movie['runtime'] != null) Text("Runtime: ${movie['runtime']} minutes"),
                  if (movie['premiered'] != null) Text("Premiered: ${movie['premiered']}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}