import 'package:flutter/material.dart';
import 'package:technical_support/view/widgets/global/custom_app_bar.dart';
import 'package:technical_support/view/widgets/global/custom_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.1,
                vertical: h * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.6,
                    child: CustomTextField(
                      h: h * 0.05,
                      hint: "Search",
                      textColor: Colors.black,
                      controller: TextEditingController(),
                      fill: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text("Status"),
                      ),
                    ],
                    onChanged: (item) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
