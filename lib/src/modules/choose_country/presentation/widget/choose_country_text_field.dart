import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/modules/choose_country/business_logic/choose_country_cubit.dart';

import '../../../../core/shared/widget/custom_text_field.dart';

class ChooseCountryTextField extends StatefulWidget {
  const ChooseCountryTextField({Key? key}) : super(key: key);

  @override
  _ChooseCountryTextFieldState createState() => _ChooseCountryTextFieldState();
}

class _ChooseCountryTextFieldState extends State<ChooseCountryTextField> {
  ChooseCountryCubit? _cubit;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _cubit = ChooseCountryCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseCountryCubit, ChooseCountryState>(
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
          onChange: (country) => _cubit!.getAllCountrySearch(country!),
        );
      },
    );
  }
}
