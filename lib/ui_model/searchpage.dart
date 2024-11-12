import 'package:flutter/material.dart'; // This ensures flutter's Image is used.
import 'package:moviesapp/models/static_movie_model.dart';
import 'DetailScreen.dart';
import 'movie_detail_page.dart'; // To navigate to the movie details page
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<moviesData> _searchResults = [];
  bool _isLoading = false;

  Future<void> _searchMovies(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final url = 'https://api.tvmaze.com/search/shows?q=$query';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List results = json.decode(response.body);
        setState(() {
          _searchResults = results
              .map((json) => moviesData.fromJson(json))
              .toList();
        });
      } else {
        print('Failed to fetch search results');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _searchMovies,
          decoration: InputDecoration(
            hintText: 'Search for movies...',
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _searchResults.isEmpty
          ? Center(child: Text('No results found'))
          : ListView.builder(
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final movie = _searchResults[index];
          return
            ListTile(
            leading: movie.show?.image?.original != null
                ? Image.network(movie.show!.image!.original!) // Use flutter's Image widget explicitly.
                : Icon(Icons.image_not_supported),
            title: Text(movie.show?.name ?? 'No Title'),
            subtitle: Text(
              movie.show?.summary
                  ?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                  'No Summary',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

