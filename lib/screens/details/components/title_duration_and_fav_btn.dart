import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/movie.dart';

class TitleDurationAndFavBtn extends StatelessWidget {
  final Movie movie;
  const TitleDurationAndFavBtn({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.title}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  children: [
                    Text(
                      movie.year.toString(),
                      style: const TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    const Text(
                      'PG-13',
                      style: TextStyle(
                        color: kTextLightColor,
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    const Text(
                      '2h 32min',
                      style: TextStyle(
                        color: kTextLightColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
