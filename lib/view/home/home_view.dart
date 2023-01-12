import 'package:flutter/material.dart';
import 'package:technical_support/components/routes/routes.dart';
import 'package:technical_support/components/statics/statics.dart';
import 'package:technical_support/models/services/navigation_service.dart';
import 'package:technical_support/models/user/user_model.dart';
import 'package:technical_support/view/widgets/global/custom_app_bar.dart';
import 'package:technical_support/view/widgets/home/bototm_sheet_widget.dart';
import 'package:technical_support/view/widgets/home/table_row.dart';
import 'package:technical_support/view/widgets/ticket/ticket_detaild_customer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            userType == UserType.customer
                ? const Center(
                    child: TicketDetaiilsCustomerWidget(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.07,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.075,
                            vertical: h * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * 0.6,
                                height: h * 0.05,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.005),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: h * 0.02,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontSize: h * 0.02,
                                      ),
                                      fillColor:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Status",
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
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SizedBox(
                          // give this Sizdbox the height exactly enough for all
                          // the tickets
                          height: ticketsList.length * (h * 0.05),
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: w * 1.45,
                                height: h * 0.5,
                                child: ListView.builder(
                                  itemCount: ticketsList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        NavigationService.push(
                                          Routes.ticketDetailsRoute,
                                        );
                                      },
                                      child: CustomTableRow(
                                        id: ticketsList[index].id,
                                        topic: ticketsList[index].topic,
                                        lastUpdate:
                                            ticketsList[index].lastUpdate,
                                        status: ticketsList[index].status,
                                        priority: ticketsList[index].priority,
                                        assignedUser:
                                            ticketsList[index].assignedUser,
                                        isFirst: index == 0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.1,
                        ),
                      ],
                    ),
                  ),
            const CustomAppBar(),
          ],
        ),
      ),
      floatingActionButton: userType == UserType.customer
          ? Builder(
              builder: (context) {
                if (userType != UserType.customer) {
                  return const SizedBox();
                }
                return FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder: (context) => const BottomSheetWidget(),
                    );
                  },
                  // TODO: will implement two diffrent icons one for create a ticket
                  // and the other for closing the bottom sheet
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                );
              },
            )
          : const SizedBox(),
    );
  }
}
