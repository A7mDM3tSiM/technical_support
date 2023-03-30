import 'package:flutter/material.dart';
import 'package:technical_support/models/user/user_repo.dart';

class CustomAppBar extends StatelessWidget {
  final String label;
  const CustomAppBar({
    super.key,
    required this.label,
  });

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
            label,
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
              IconButton(
                onPressed: () => UserRepo().logout(),
                icon: const Icon(Icons.logout),
                iconSize: h * 0.035,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
