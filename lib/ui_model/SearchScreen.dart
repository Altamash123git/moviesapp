import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DetailScreen.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResults = [];
  TextEditingController _controller = TextEditingController();



  Future<void> searchMovies(String query) async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                searchMovies(_controller.text);
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final movie = searchResults[index]['show'];
          return ListTile(
            leading: Image.network(movie['image']?['medium'] ?? 'https://via.placeholder.com/150'),
            title: Text(movie['name']),
            subtitle: Text(movie['summary'] ?? 'No summary available'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
              );
            },
          );
        },
      ),
    );
  }
}