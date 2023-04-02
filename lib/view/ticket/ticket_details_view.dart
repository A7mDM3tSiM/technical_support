import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/components/statics/statics.dart';
import 'package:technical_support/models/arguments/ticket_view_arguments.dart';
import 'package:technical_support/view/widgets/fileds/ticket_details_filed.dart';
import 'package:technical_support/view/widgets/global/custom_app_bar.dart';
import 'package:technical_support/view/widgets/ticket/add_file_widget.dart';
import 'package:technical_support/view/widgets/ticket/ticket_details_widget.dart';

import '../../provider/ticket_provider.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key});

  String? _priorityDropDownValue(String priority) {
    if (ticketPriorties.contains(priority)) {
      return priority;
    }
    return null;
  }

  String? _statusDropDownValue(String status) {
    if (ticketStatus.contains(status)) {
      return status;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    final args =
        ModalRoute.of(context)!.settings.arguments as TicketViewArguments;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.03),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: h * 0.07,
                      ),
                      const TicketDetailsWidget(),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                        child: const TicketDetailsFiled(
                          comment: "Write your comment",
                          readOnly: false,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const AddFileWidget(),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                DropdownButton(
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        "Assign to a user",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(fontSize: h * 0.017),
                                      ),
                                    ),
                                  ],
                                  onChanged: (item) {},
                                ),
                                SizedBox(
                                  width: w * 0.05,
                                ),
                                DropdownButton<String>(
                                  value: _priorityDropDownValue(
                                    args.ticket?.priority ?? "",
                                  ),
                                  items: ticketPriorties
                                      .map(
                                        (priorty) => DropdownMenuItem<String>(
                                          value: priorty,
                                          child: Text(
                                            priorty,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(fontSize: h * 0.017),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (item) {
                                    if (item != null) {
                                      ticketProvider.toUpdateData['priority'] =
                                          item;
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    underline: const SizedBox(),
                                    value: _statusDropDownValue(
                                      args.ticket?.status ?? "",
                                    ),
                                    items: ticketStatus
                                        .map(
                                          (status) => DropdownMenuItem<String>(
                                            value: status,
                                            child: Text(
                                              status,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                      fontSize: h * 0.017),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (item) {
                                      if (item != null) {
                                        ticketProvider.toUpdateData['status'] =
                                            item;
                                      }
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => ticketProvider
                                      .updateTicket(args.ticket?.id),
                                  child: Text(
                                    "Submit",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomAppBar(label: "Ticket Details")
          ],
        ),
      ),
    );
  }
}
