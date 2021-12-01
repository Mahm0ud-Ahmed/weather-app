import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/favorite/presentation/widget/country_text_field.dart';
import 'package:weather_app/src/modules/favorite/presentation/widget/search_and_favorite_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CountryTextField(),
              SizedBox(
                height: 4,
              ),
              SearchAndFavoriteItem(),
            ],
          ),
        ),
      ),
    );
  }
}
