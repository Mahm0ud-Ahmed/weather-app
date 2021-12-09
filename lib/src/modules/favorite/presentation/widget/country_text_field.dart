import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_state.dart';

import 'custom_text_field.dart';

class CountryTextField extends StatefulWidget {
  const CountryTextField({Key? key}) : super(key: key);

  @override
  _CountryTextFieldState createState() => _CountryTextFieldState();
}

class _CountryTextFieldState extends State<CountryTextField> {
  FavoriteCountryCubit? _cubit;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _cubit = FavoriteCountryCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCountryCubit, FavoriteCountryState>(
      builder: (context, state) {
        return CustomTextField(
          controller: _controller,
          prefixIcon: const Icon(IconBroken.Search),
          suffix: UnconstrainedBox(
            child: SizedBox(
              width: 18,
              height: 18,
              child: state is LoadingCountrySearch
                  ? const CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : Container(),
            ),
          ),
          hint: 'Search of Country',
          onChange: (country) async {
            await _cubit!.getAllCountrySearch(country!);
          },
        );
      },
    );
  }
}
