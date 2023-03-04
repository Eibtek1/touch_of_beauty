import 'package:flutter/material.dart';

import '../../../widgets/home_screen_widgets/search_check_button_item.dart';

class ChooseAddressScreen extends StatelessWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return SearchCheckButtonItem(
                  index: index,
                  currentIndex: 0,
                  title: '0',
                  onPressed: () {

                  },
                  onChanged: (value) {

                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
