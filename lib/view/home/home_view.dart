import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/components/routes/routes.dart';
import 'package:technical_support/components/statics/statics.dart';
import 'package:technical_support/models/arguments/ticket_view_arguments.dart';
import 'package:technical_support/models/services/api_services.dart';
import 'package:technical_support/models/services/database_services.dart';
import 'package:technical_support/models/services/navigation_service.dart';
import 'package:technical_support/models/ticket/ticket_repo.dart';
import 'package:technical_support/models/user/user_model.dart';
import 'package:technical_support/provider/ticket_provider.dart';
import 'package:technical_support/provider/user_provider.dart';
import 'package:technical_support/view/widgets/global/custom_app_bar.dart';
import 'package:technical_support/view/widgets/home/bototm_sheet_widget.dart';
import 'package:technical_support/view/widgets/home/table_row.dart';
import 'package:technical_support/view/widgets/ticket/ticket_detaild_customer_widget.dart';

import '../../models/ticket/ticket_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        await userProvider.getEmployees();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = Provider.of<User?>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: DataBaseServiecs(
          uid: user?.uid ?? "",
          collection: 'users',
        ).userData,
        builder: (context, snapshot) {
          if (userProvider.apiResponse.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SafeArea(
            child: Stack(
              children: [
                snapshot.data?.type == UserType.customer
                    ? StreamBuilder<List<Ticket>>(
                        stream:
                            DataBaseServiecs(collection: 'tickets').ticketsList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05,
                                  vertical: h * 0.1,
                                ),
                                child: TicketDetaiilsCustomerWidget(
                                  ticket: snapshot.data?[index],
                                ),
                              );
                            },
                          );
                        },
                      )
                    : Column(
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
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                    ),
                                  ),
                                ),
                                DropdownButton<String>(
                                  items: ticketStatus
                                      .map(
                                        (status) => DropdownMenuItem<String>(
                                          value: status,
                                          child: Text(
                                            status,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(fontSize: h * 0.017),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (item) {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          StreamBuilder<List<Ticket?>>(
                            stream: TicketRepo().ticketList,
                            builder: (context, snapshot) {
                              final List<Ticket?> ticketsList = [
                                const Ticket()
                              ];
                              ticketsList.addAll(snapshot.data ?? []);

                              if (!snapshot.hasData) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: h * 0.35,
                                    ),
                                    const CircularProgressIndicator.adaptive(),
                                  ],
                                );
                              }
                              return SizedBox(
                                // give this Sizdbox the height exactly enough for all
                                // the tickets
                                height: ticketsList.length * (h * 0.05),
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: w * 1.465,
                                      height: h * 0.5,
                                      child: ListView.builder(
                                        itemCount: ticketsList.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Provider.of<TicketProvider>(
                                                      context,
                                                      listen: false)
                                                  .toUpdateData
                                                  .clear();
                                              if (index != 0) {
                                                NavigationService.push(
                                                  Routes.ticketDetailsRoute,
                                                  arg: TicketViewArguments(
                                                    ticketsList[index],
                                                  ),
                                                );
                                              }
                                            },
                                            child: CustomTableRow(
                                              id: index.toString(),
                                              topic:
                                                  ticketsList[index]?.topic ??
                                                      "",
                                              lastUpdate: ticketsList[index]
                                                      ?.updatedAt ??
                                                  '',
                                              status:
                                                  ticketsList[index]?.status ??
                                                      "",
                                              priority: ticketsList[index]
                                                      ?.priority ??
                                                  "",
                                              assignedUser: ticketsList[index]
                                                      ?.assignedUser ??
                                                  "",
                                              isFirst: index == 0,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: h * 0.1,
                          ),
                        ],
                      ),
                const CustomAppBar(
                  label: "Technical Support",
                  hasLogoutButton: true,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: StreamBuilder(
        stream: DataBaseServiecs(
          uid: user?.uid ?? "",
          collection: "users",
        ).userData,
        builder: (_, snapshot) => Builder(
          builder: (context) {
            if (snapshot.data?.type != UserType.customer) {
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
              // TODO: will implement two diffrent icons one for create
              // a ticket and the anther for closing the bottom sheet
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
