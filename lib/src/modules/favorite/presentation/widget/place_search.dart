import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_state.dart';
import 'package:weather_app/src/modules/favorite/entity/remote/details_country.dart';
import 'package:weather_app/src/modules/other_country/presentation/other_country_details.dart';

class PlaceSearch extends StatefulWidget {
  const PlaceSearch({Key? key}) : super(key: key);

  @override
  _PlaceSearchState createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch> {
  FavoriteCountryCubit? _cubit;
  List<DetailsCountry>? _countries;

  @override
  void initState() {
    _cubit = FavoriteCountryCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCountryCubit, FavoriteCountryState>(
      builder: (context, state) {
        if (state is SuccessCountrySearch) {
          _countries = state.countries;
        }
        return _countries != null && _countries!.isNotEmpty
            ? Container(
                padding: const EdgeInsets.all(12),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _cubit!.cutWordFromText(_countries![index].name!),
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        _countries![index].name!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OtherCountryDetails(
                            lat: _countries![index].lat,
                            long: _countries![index].lon,
                          );
                        })).then((value) {
                          _cubit!.clearData();
                          _cubit!.getFavoriteCountry();
                        });
                        FocusScope.of(context).unfocus();
                      },
                    );
                  },
                  itemCount: _countries!.length,
                ),
              )
            : Container();
      },
    );
  }
}
