import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> popularMovies;
  const MovieSlider({Key? key, required this.popularMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(popularMovies.isEmpty){
      return const SizedBox(
        height: 270,
        child: Center(child: CircularProgressIndicator()),
      );
    }else{
      return SizedBox(
        width: double.infinity,
        height: 295,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Populars',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
                  itemBuilder: (_, int index) =>
                      _MoviePoster(movie: popularMovies[index])),
            )
          ],
        ),
      );
    }
    
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterPath),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
