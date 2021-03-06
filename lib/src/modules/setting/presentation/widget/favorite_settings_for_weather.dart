import 'package:flutter/material.dart';

class FavoriteSettingsForWeather extends StatelessWidget {
  FavoriteSettingsForWeather(
      {Key? key,
      this.title,
      this.dropdownValue,
      this.valueGroup,
      this.onChooseItem})
      : super(key: key);
  final String? title;
  late String? dropdownValue;
  final List<String>? valueGroup;
  final Function(String? newValue)? onChooseItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title!),
      trailing: DropdownButton<String>(
        value: dropdownValue,
        onChanged: onChooseItem,
        underline: Container(),
        items: valueGroup!.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }
}
