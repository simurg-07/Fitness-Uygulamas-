import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_getx/controller.dart';


import '../models/record.dart';

class recordListTile extends StatelessWidget {
  final Record record;
  recordListTile({Key? key, required this.record}) : super(key: key);
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ListTile(
          leading: _buildDate(),
          title: _buildWeight(),
          trailing: _buildIcons(),
        ),
      ),
    );
  }

  Row _buildIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () {
            _controller.deleteRecord(record);
          },
          icon: Icon(Icons.delete),
          color: Colors.red,
        )
      ],
    );
  }

  Center _buildWeight() => Center(
          child: Text(
        "${record.weight}",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ));

  Text _buildDate() => Text(DateFormat("EEE, MMM, d").format(record.dateTime));
}
