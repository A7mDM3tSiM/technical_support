import 'package:flutter/material.dart';
import 'package:technical_support/view/widgets/fileds/ticket_details_filed.dart';
import 'package:technical_support/view/widgets/ticket/add_file_widget.dart';
import 'package:technical_support/view/widgets/ticket/ticket_details_widget.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.03),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
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
                    height: h * 0.025,
                  ),
                  const AddFileWidget(),
                  SizedBox(
                    height: h * 0.1,
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
                            DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Priority",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontSize: h * 0.017),
                                  ),
                                ),
                              ],
                              onChanged: (item) {},
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.black,
                                ),
                              ),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Submit as",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(fontSize: h * 0.017),
                                    ),
                                  ),
                                ],
                                onChanged: (item) {},
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
      ),
    );
  }
}
