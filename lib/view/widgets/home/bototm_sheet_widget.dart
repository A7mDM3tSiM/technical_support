import 'package:flutter/material.dart';
import 'package:technical_support/models/services/navigation_service.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Topic",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: h * 0.005,
          ),
          TextField(
            controller: TextEditingController(),
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
              controller: TextEditingController(),
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
          Container(
            height: h * 0.05,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(
                width: .5,
                color: Colors.black,
              ),
            ),
            child: Center(
              child: Text(
                "Add a file",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontSize: h * 0.02,
                    ),
              ),
            ),
          ),
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
                onPressed: () {
                  NavigationService.pop();
                },
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
