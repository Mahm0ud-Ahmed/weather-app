import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/favorite/presentation/widget/place_search.dart';

class SearchAndFavoriteItem extends StatefulWidget {
  const SearchAndFavoriteItem({Key? key}) : super(key: key);

  @override
  _SearchAndFavoriteItemState createState() => _SearchAndFavoriteItemState();
}

class _SearchAndFavoriteItemState extends State<SearchAndFavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2 / 2.4
                    : 2 / 2.5,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Text('adasdsa');
          },
        ),
        const PlaceSearch(),
      ],
    );
  }
}
