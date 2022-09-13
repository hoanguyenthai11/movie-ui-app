import 'package:flutter/material.dart';
import 'package:movie_ui_application/screens/home/components/movie_card.dart';
import '../../../constants.dart';
import '../../../models/movie.dart';
import 'dart:math' as math;

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController? _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => buildMovieSlider(index)),
      ),
    );
  }

  Widget buildMovieSlider(int index) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350),
      opacity: initialPage == index ? 1 : 0.4,
      child: AnimatedBuilder(
          animation: _pageController!,
          builder: (context, child) {
            double value = 0;
            if (_pageController!.position.haveDimensions) {
              value = index - _pageController!.page!.toDouble();
              //We use 0.38 bc 180 * 0.038 = 7 almost and we need to rotate ourt poster 7 degree
              //We user clamp so that our value vary from -1 to 1
              value = (value * 0.038).clamp(-1, 1);
            }
            return Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(
                movie: movies[index],
              ),
            );
          }),
    );
  }
}
