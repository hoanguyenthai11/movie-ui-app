import 'package:flutter/material.dart';
import 'package:movie_ui_application/constants.dart';
import 'package:movie_ui_application/screens/details/components/backdrop_rating.dart';
import 'package:movie_ui_application/screens/details/components/cast_and_crew.dart';
import 'package:movie_ui_application/screens/details/components/genres.dart';
import 'package:movie_ui_application/screens/details/components/title_duration_and_fav_btn.dart';

import '../../../models/movie.dart';

class Body extends StatelessWidget {
  final Movie movie;
  const Body({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackdropAndRating(
            size: size,
            movie: movie,
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          TitleDurationAndFavBtn(
            movie: movie,
          ),
          Genres(movie: movie),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              'Plot Summary',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Text(
              movie.plot.toString(),
              style: const TextStyle(
                color: Color(
                  0xFF737599,
                ),
              ),
            ),
          ),
          CastAndCrew(casts: movie.cast!),
        ],
      ),
    );
  }
}
