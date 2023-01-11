import 'package:flutter/material.dart';

class TableRowCell extends StatelessWidget {
  final String label;
  final double width;
  final Color color;
  final Color textColor;

  const TableRowCell({
    super.key,
    required this.label,
    required this.width,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Container(
      height: h * 0.05,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 0.5,
          color: Colors.grey[300]!,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: textColor, fontSize: h * 0.015),
        ),
      ),
    );
  }
}
