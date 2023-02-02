import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/view/employe_details.dart';
import 'package:new_project/view/searchlist.dart';
import 'package:provider/provider.dart';

import '../helper/themes.dart';
import '../model/user_data_modell.dart';
import '../provider/employee_provider.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  UserdDataModel? _userDataModel;

  void initState() {
    super.initState();
    _getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    print(_userDataModel?.name);
    // final postMdl = Provider.of<EmployeeData>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 45,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilterScreen()));
                    },
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.search),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Employee Search",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ],
                        ))),
                  ),
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  // child: postMdl.loading
                  child: context.watch<EmployeeData>().loading
                      ? Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.builder(
                          // itemCount: postMdl.post.length,
                          itemCount: context.read<EmployeeData>().post.length,
                          itemBuilder: ((context, index) {
                            return Container(
                                child: InkWell(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmployeeDetails(
                                          productId: context
                                              .read<EmployeeData>()
                                              .post[index]!
                                              .id!
                                              .toInt())),
                                );
                              }),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: Image.network(
                                          "${context.read<EmployeeData>().post[index]?.profileImage ?? ""}")
                                      .image,
                                ),
                                title: Text(
                                    "${context.read<EmployeeData>().post[index]?.name}"),
                                subtitle: Text(
                                    "${context.read<EmployeeData>().post[index]?.company?.name}"),
                              ),
                            )
                                // Text(
                                //     '${context.read<EmployeeData>().post[index]?.name}'),
                                );
                          }))),
            ),
          ],
        ),
      ),
    );
  }

  _getUserdata() async {
    _userDataModel = await Themes.getUserData();
  }
}
