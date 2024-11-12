import 'package:flutter/material.dart';
import 'package:moviesapp/models/static_movie_model.dart' as model;
import 'package:moviesapp/ui_model/DetailScreen.dart';

class MovieCard extends StatelessWidget {
  final model.moviesData movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MovieDetailPage(movie: movie)));

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (movie.show?.image?.original != null)
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    movie.show!.image!.original!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey,
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                Container(
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.show?.name ?? 'No Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Language: ${movie.show?.language ?? 'N/A'}',
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(height: 5),
                    Text(
                      movie.show?.summary ?? 'No Summary Available',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}