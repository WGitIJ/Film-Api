import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print('Movies loaded: ${moviesProvider.onDisplayMovies.length}');
    print("Popular movies loaded: ${moviesProvider.popularMovies.length}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              if(moviesProvider.onDisplayMovies.isEmpty)
                const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()),
                )
              else
                CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Slider de pel·licules
              if(moviesProvider.popularMovies.isEmpty)
                const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()),
                )
              else
                MovieSlider(popularMovies: moviesProvider.popularMovies),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
