import 'package:flutter/material.dart';

import '../../../models/ticket/ticket_model.dart';

class TicketDetailsWidget extends StatelessWidget {
  final Ticket? ticket;
  const TicketDetailsWidget({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.9,
      padding: EdgeInsets.symmetric(
        vertical: h * 0.02,
        horizontal: w * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(h * 0.01),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(-1, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Topic: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
                TextSpan(
                  text: ticket?.topic,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.005,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Status: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
                TextSpan(
                  text: ticket?.status,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.005,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Priority: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
                TextSpan(
                  text: ticket?.priority,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.005,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Created At: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
                TextSpan(
                  text: ticket?.cratedAt,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.005,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Updated At: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
                TextSpan(
                  text: ticket?.updatedAt,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Description: ",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: h * 0.016,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.005,
          ),
          Container(
            height: h * 0.13,
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.01,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: .5,
              ),
            ),
            child: TextField(
              controller: TextEditingController(text: ticket?.description),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                    fontSize: h * 0.017,
                  ),
              maxLines: null,
              readOnly: true,
              decoration: const InputDecoration(
                filled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
