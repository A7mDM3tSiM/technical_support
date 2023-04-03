import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/components/statics/statics.dart';
import 'package:technical_support/provider/user_provider.dart';
import 'package:technical_support/view/widgets/home/table_row_cell.dart';

import '../../../models/user/user_model.dart';

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

  String _getAssignedUser(List<User> employees) {
    return employees.where((user) => user.uid == assignedUser).first.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final _emplyees =
        Provider.of<UserProvider>(context, listen: false).employees;
    var w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        TableRowCell(
          label: isFirst ? "Id" : id,
          width: w * 0.1,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: isFirst ? "Last Update" : lastUpdate.toShortString(10),
          width: w * 0.2,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: isFirst ? "Topic" : topic.toShortString(30),
          width: w * 0.6,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: isFirst ? "Assigned User" : _getAssignedUser(_emplyees),
          width: w * 0.25,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: isFirst ? "Status" : status,
          width: w * 0.165,
          textColor: isFirst ? Colors.white : Colors.black,
          color: isFirst
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        TableRowCell(
          label: isFirst ? "Priority" : priority,
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
