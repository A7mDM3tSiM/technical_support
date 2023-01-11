import 'package:flutter/material.dart';

class AddFileWidget extends StatelessWidget {
  const AddFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.16,
      width: w * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Add a photo or a pdf that may descripe the issue"),
          SizedBox(
            height: h * 0.04,
          ),
          Container(
            height: h * 0.06,
            width: w,
            color: Theme.of(context).colorScheme.secondary,
            child: Center(
              child: Text(
                "Add a file",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontSize: h * 0.02,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
