import 'package:flutter/material.dart';
import 'package:technical_support/view/widgets/home/table_row_cell.dart';

class CustomTableRow extends StatelessWidget {
  final String id;
  final String lastUpdate;
  final String topic;
  final String status;
  final String priority;
  final String assignedUser;
  final bool isFirst;

  const CustomTableRow({
    super.key,
    required this.id,
    required this.lastUpdate,
    required this.topic,
    required this.status,
    required this.priority,
    required this.assignedUser,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        TableRowCell(
          label: id,
          width: w * 0.1,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: lastUpdate,
          width: w * 0.2,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: topic,
          width: w * 0.6,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: assignedUser,
          width: w * 0.25,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: status,
          width: w * 0.15,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: priority,
          width: w * 0.15,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
