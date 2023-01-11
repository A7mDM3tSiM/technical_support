import 'package:flutter/material.dart';

class TicketDetailsFiled extends StatelessWidget {
  const TicketDetailsFiled({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
          ),
          child: Text(
            "Comment",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: h * 0.017,
                ),
          ),
        ),
        SizedBox(
          height: h * 0.005,
        ),
        Container(
          height: h * 0.13,
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: .5,
              color: Colors.black,
            ),
          ),
          child: TextField(
            controller: TextEditingController(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: h * 0.017,
                ),
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Write your comment",
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: h * 0.017,
                    color: Colors.grey[500],
                  ),
              filled: false,
            ),
          ),
        ),
      ],
    );
  }
}
