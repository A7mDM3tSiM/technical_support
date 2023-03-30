import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/models/services/navigation_service.dart';
import 'package:technical_support/provider/ticket_provider.dart';
import 'package:technical_support/view/widgets/ticket/add_file_widget.dart';

import '../../../models/user/user_model.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ticket = Provider.of<TicketProvider>(context, listen: false);
    final user = Provider.of<User?>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      height: h * 0.7,
      padding: EdgeInsets.symmetric(vertical: h * 0.05, horizontal: w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(h * 0.03),
          topRight: Radius.circular(h * 0.03),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ListView(
        children: [
          Text(
            "Topic",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: h * 0.005,
          ),
          TextField(
            controller: ticket.topicController,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            "Description",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: h * 0.005,
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            height: h * 0.2,
            child: TextFormField(
              controller: ticket.descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(h * 0.01),
                filled: false,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            "Adds",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: h * 0.005,
          ),
          const AddFileWidget(),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigationService.pop();
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.02,
                      ),
                ),
              ),
              SizedBox(
                width: w * 0.03,
              ),
              ElevatedButton(
                onPressed: () => ticket.setTicket(user?.uid),
                child: Text(
                  "Send Ticket",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
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
