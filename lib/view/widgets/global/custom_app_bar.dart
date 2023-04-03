import 'package:flutter/material.dart';
import 'package:technical_support/models/user/user_repo.dart';

import '../../../models/services/navigation_service.dart';

class CustomAppBar extends StatelessWidget {
  final String label;
  final bool hasBackButton;
  final bool hasLogoutButton;
  const CustomAppBar({
    super.key,
    this.hasBackButton = false,
    this.hasLogoutButton = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.07,
      width: w,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (hasBackButton)
                IconButton(
                  onPressed: () => NavigationService.pop(),
                  icon: const Icon(Icons.arrow_back),
                  iconSize: h * 0.025,
                  color: Colors.white,
                ),
              Padding(
                padding: EdgeInsets.all(w * 0.01),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: h * 0.025,
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                iconSize: h * 0.03,
                color: Colors.white,
              ),
              if (hasLogoutButton)
                IconButton(
                  onPressed: () => UserRepo().logout(),
                  icon: const Icon(Icons.logout),
                  iconSize: h * 0.03,
                  color: Colors.white,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
