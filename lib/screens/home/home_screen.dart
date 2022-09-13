import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_ui_application/constants.dart';
import 'package:movie_ui_application/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/search.svg"))
      ],
    );
  }
}
