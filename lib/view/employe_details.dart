import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/provider/employee_provider.dart';
import 'package:provider/provider.dart';

import '../model/user_data_modell.dart';

class EmployeeDetails extends StatefulWidget {
  final int productId;

  const EmployeeDetails({super.key, required this.productId});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<EmployeeData>(context, listen: false)
        .findByid(widget.productId);
    return SafeArea(
        child: Scaffold(
            body: Container(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 40,
                backgroundImage: Image.network(
                  "${loadedProduct?.profileImage}",
                ).image,
              ),
            ),
            Text(
              " Name :${loadedProduct?.name}",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
        Text(
          " Email :${loadedProduct?.email}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        Text(
          " address : ${loadedProduct?.address?.city},${loadedProduct?.address?.street},${loadedProduct?.address?.zipcode}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        Text(
          " phone :${loadedProduct?.phone ?? ""}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        Text(
          " Website :${loadedProduct?.website ?? ""}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        Text(
          " Company  :${loadedProduct?.company?.name ?? ""}",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    ))));
  }
}
