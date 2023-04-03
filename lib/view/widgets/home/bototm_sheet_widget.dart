import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/models/services/api_services.dart';
import 'package:technical_support/models/services/navigation_service.dart';
import 'package:technical_support/provider/ticket_provider.dart';
import 'package:technical_support/view/widgets/ticket/add_file_widget.dart';

import '../../../models/user/user_model.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});
  static final _key = GlobalKey<FormState>();

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
      child: Form(
        key: _key,
        child: ListView(
          children: [
            Text(
              "Topic",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: h * 0.005,
            ),
            TextFormField(
              controller: ticket.topicController,
              validator: (val) =>
                  val != null && val.isEmpty ? "Topic can not be empty" : null,
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
                validator: (val) => val != null && val.isEmpty
                    ? "Description can not be empty"
                    : null,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ticket.apiResponse.status == Status.loading
                    ? const CircularProgressIndicator.adaptive()
                    : ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState != null) {
                            if (_key.currentState!.validate()) {
                              await ticket.setTicket(user?.uid);
                              NavigationService.pop();
                            }
                          }
                        },
                        child: Text(
                          "Send Ticket",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
