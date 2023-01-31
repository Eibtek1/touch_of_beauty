import 'package:flutter/material.dart';
import 'features/authentication/presentation/widgets/citeis_dropdown_button.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CityDropDownButton(),
      ),
    );
  }
}
