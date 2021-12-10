import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_state.dart';
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
        return _cubit!.favorite != null
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
                    itemCount: _cubit!.favorite!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          List<double> latLong = _cubit!.convertToDouble(
                              _cubit!.favorite![index].latLong!);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OtherCountryDetails(
                              lat: latLong.first,
                              long: latLong.last,
                            );
                          })).then((value) => _cubit!.getFavoriteCountry());
                        },
                        child: CardItem(
                          date: _cubit!.favorite![index].date,
                          temp: _cubit!.favorite![index].tempC.toString(),
                          urlIcon: _cubit!.favorite![index].urlIcon,
                          region: _cubit!.favorite![index].region,
                          country: _cubit!.favorite![index].country,
                          humidity:
                              _cubit!.favorite![index].humidity.toString(),
                          wind: _cubit!.favorite![index].wind.toString(),
                          onUpdate: () =>
                              _cubit!.updateCountry(_cubit!.favorite![index]),
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
