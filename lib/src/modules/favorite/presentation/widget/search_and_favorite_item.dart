import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_state.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/modules/favorite/presentation/widget/card_item.dart';
import 'package:weather_app/src/modules/favorite/presentation/widget/place_search.dart';
import 'package:weather_app/src/modules/other_country/presentation/other_country_details.dart';

class SearchAndFavoriteItem extends StatefulWidget {
  const SearchAndFavoriteItem({Key? key}) : super(key: key);

  @override
  _SearchAndFavoriteItemState createState() => _SearchAndFavoriteItemState();
}

class _SearchAndFavoriteItemState extends State<SearchAndFavoriteItem> {
  FavoriteCountryCubit? _cubit;
  List<Favorite> _favorites = [];

  @override
  void initState() {
    _cubit = FavoriteCountryCubit.get(context);
    _cubit!.getFavoriteCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCountryCubit, FavoriteCountryState>(
      builder: (context, state) {
        if (state is SuccessFavoriteCountry) {
          _favorites = state.favorite!;
        }
        return state is! LoadingFavoriteCountry
            ? Stack(
                children: [
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.4 / 2.7,
                    ),
                    itemCount: _favorites.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          List<double> latLong = _cubit!
                              .convertToDouble(_favorites[index].latLong!);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OtherCountryDetails(
                              lat: latLong.first,
                              long: latLong.last,
                            );
                          })).then((value) => _cubit!.getFavoriteCountry());
                        },
                        child: CardItem(
                          date: _favorites[index].date,
                          temp: _favorites[index].tempC.toString(),
                          urlIcon: _favorites[index].urlIcon,
                          region: _favorites[index].region,
                          country: _favorites[index].country,
                          humidity: _favorites[index].humidity.toString(),
                          wind: _favorites[index].wind.toString(),
                          onUpdate: () =>
                              _cubit!.updateCountry(_favorites[index]),
                        ),
                      );
                    },
                  ),
                  const PlaceSearch(),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
