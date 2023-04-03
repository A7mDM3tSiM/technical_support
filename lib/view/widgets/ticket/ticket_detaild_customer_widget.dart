import 'package:flutter/material.dart';
import 'package:technical_support/view/widgets/fileds/ticket_details_filed.dart';
import 'package:technical_support/view/widgets/ticket/customer_ticket_details_sub_widget.dart';

import '../../../models/ticket/ticket_model.dart';

class TicketDetaiilsCustomerWidget extends StatelessWidget {
  final Ticket? ticket;
  const TicketDetaiilsCustomerWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.75,
      width: w * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 10),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(-2, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: h * 0.06,
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Ticket Deatils",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: h * .02,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * .02),
            child: Column(
              children: [
                CustomerTicketDetailsSubWidget(
                  label: "Topic:",
                  detail: ticket?.topic ?? "",
                ),
                CustomerTicketDetailsSubWidget(
                  label: "Status:",
                  detail: ticket?.status ?? "",
                ),
                CustomerTicketDetailsSubWidget(
                  label: "CreatedAt:",
                  detail: ticket?.cratedAt ?? "",
                ),
                CustomerTicketDetailsSubWidget(
                  label: "Updated At:",
                  detail: ticket?.updatedAt ?? "",
                ),
                const CustomerTicketDetailsSubWidget(
                  label: "Adds:",
                  detail: "",
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: h * .017,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
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
                    controller: TextEditingController(
                      text: ticket?.description,
                    ),
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
                SizedBox(
                  height: h * 0.02,
                ),
                const TicketDetailsFiled(
                  comment: "",
                  readOnly: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
