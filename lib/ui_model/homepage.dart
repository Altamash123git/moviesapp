import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/ui_model/cardcustomWidget.dart';
import 'package:moviesapp/utilities/urls.dart';
import 'dart:convert';
import '../models/static_movie_model.dart';
import 'DetailScreen.dart';
//import 'SearchScreen.dart';


import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
getMovies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
      ),
      body:

      FutureBuilder<List<moviesData>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Movies Found.'));
          }

          final movies = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 376,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(movie: movie),
                      ),
                    );
                  },
                  child: MovieCard(movie: movie),
                );
              },
            ),
          );
        },
      ),

     /* FutureBuilder<List<moviesData>>(future: getMovies(), builder: (_,snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text("error: ${snapshot.error}"),
          );
        }if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if(snapshot.hasData){
          final movies= snapshot.data!;
          ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.show?.name ?? 'Unknown Movie'),
                subtitle: Text('Score: ${movie.score?.toStringAsFixed(1) ?? 'N/A'}'),
                trailing: Text(movie.show?.language ?? 'Unknown Language'),
              );
            },
          );
          //final data= snapshot.data;

          //return snapshot.data!=null?snapshot.data!.Show!=null?Center(child: Text("ooo yess"),):Center(child: Text("no data"),):Center(child: Text("data not recieved"),);
        }
        return Container(
          child: Text("hlo i am here"),
        );
      }),*/
    );
  }
}


Future<List<moviesData>> getMovies() async {
  final url = Uri.parse(Urls.homeurl); // Replace with your API endpoint
  final response = await http.get(url);
print(response.statusCode);
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    print(jsonResponse);

    // Map JSON response to list of moviesData
    return jsonResponse.map((movie) => moviesData.fromJson(movie)).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}

/*Future<moviesData?> getMovies() async{

  var response= await http.get(Uri.parse(Urls.homeurl));
  print(response.statusCode);

  if(response.statusCode==200){
    var mdata= jsonDecode(response.body);
    return moviesData.fromJson(mdata)
    List<dynamic> data=jsonDecode(response.body) ;
    return data.map((movie) => moviesData.fromJson(movie)).toList();

    List<moviesData> items=  data.map((item)=>moviesData.fromJson(item)).toList();
    print(data);
    return items;
      //moviesData.fromJson(data as Map<String, dynamic> );


  }

}*/
