import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_project/provider/employee_provider.dart';

import '../model/user_data_modell.dart';
import '../serach_widget.dart';
import 'employe_details.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String query = '';
  List<UserdDataModel> user = [];
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final user = await EmployeeData.searchResult(query);

    setState(() => this.user = user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(children: [
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
                child: SearchWidget(
                    text: query,
                    onChanged: searchResult,
                    hintText: " Search Employee")),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      var userlist = user[index];

                      return GestureDetector(
                          onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmployeeDetails(
                                          productId: userlist.id!.toInt() )),
                                );

                          }, child:  ListTile(leading: CircleAvatar(
                      backgroundImage: Image.network(
                                                  "${userlist.profileImage}").image  ,
                      ),
                      title: Text("${userlist.name}") ,
                      subtitle: Text("${userlist.email}"),
                      
                      ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future searchResult(String query) async => debounce(() async {
        final user = await EmployeeData.searchResult(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.user = user;
        });
      });
}
