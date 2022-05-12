import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InfoWidget extends StatelessWidget {
  late String location;
  late String cost;
  late String acreage;
  late String owner;
  late String phone;
  late String time;

  InfoWidget(this.location, this.cost, this.acreage, this.owner, this.phone,
      this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Ionicons.location_outline),
              SizedBox(
                width: 4,
              ),
              Text(location)
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Icon(Ionicons.card_outline),
              SizedBox(
                width: 4,
              ),
              Text(cost)
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Ionicons.expand_outline),
                    SizedBox(
                      width: 4,
                    ),
                    Text(acreage)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Ionicons.ear_outline),
                    SizedBox(
                      width: 4,
                    ),
                    Text(owner)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Ionicons.call_outline),
                    SizedBox(
                      width: 4,
                    ),
                    Text(phone)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Ionicons.time_outline),
                    SizedBox(
                      width: 4,
                    ),
                    Text(time)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
