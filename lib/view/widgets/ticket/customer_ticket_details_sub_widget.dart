import 'package:flutter/material.dart';

class CustomerTicketDetailsSubWidget extends StatelessWidget {
  final String label;
  final String detail;

  const CustomerTicketDetailsSubWidget({
    super.key,
    required this.label,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.05,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black45,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: h * .017,
                ),
          ),
          SizedBox(
            width: w * 0.55,
            child: Text(detail),
          ),
        ],
      ),
    );
  }
}
