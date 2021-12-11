import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/shared/remote/search_country/entity/details_country.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/choose_country/business_logic/choose_country_cubit.dart';
import 'package:weather_app/src/modules/choose_country/presentation/widget/choose_country_text_field.dart';
import 'package:weather_app/src/modules/nav_bar/nav_bar.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({Key? key}) : super(key: key);

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  List<DetailsCountry>? _searchCountry;
  ChooseCountryCubit? _cubit;

  @override
  void initState() {
    _cubit = ChooseCountryCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ChooseCountryTextField(),
              const SizedBox(
                height: 4,
              ),
              hasConnection
                  ? BlocBuilder<ChooseCountryCubit, ChooseCountryState>(
                      builder: (context, state) {
                        if (state is SuccessCountrySearch) {
                          _searchCountry = state.searchCountry;
                        }
                        return _searchCountry != null
                            ? Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          _cubit!.cutWordFromText(
                                              _searchCountry![index].name!),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        subtitle: Text(
                                          _searchCountry![index].name!,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        onTap: () async {
                                          _cubit!
                                              .saveMyCountryData(
                                                  _searchCountry![index])
                                              .then((value) {
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                              builder: (_) {
                                                return const NavBar();
                                              },
                                            ), (route) => false);
                                          });
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemCount: _searchCountry!.length),
                              )
                            : Text(
                                'Search any Country',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'please check your Internet connection!',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
