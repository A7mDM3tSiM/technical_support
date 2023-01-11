import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.07,
      width: w,
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Technical Support",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: h * 0.03,
                  color: Colors.white,
                ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                iconSize: h * 0.035,
                color: Colors.white,
              ),
              SizedBox(
                width: w * 0.02,
              ),
              CircleAvatar(
                radius: h * 0.016,
                backgroundColor: Colors.white,
                child: Text(
                  "M",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: h * 0.02,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}