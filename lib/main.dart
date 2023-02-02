import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:new_project/provider/employee_provider.dart';
import 'package:new_project/view/employe_details.dart';
import 'package:new_project/view/eployee_list.dart';
import 'package:new_project/view/new_employee.dart';
import 'package:new_project/view/searchlist.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<EmployeeData>(create: (_) => EmployeeData()),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EmployeeData>(context, listen: false).getPostData(context);
      // Provider.of<EmployeeData>(context, listen: false).getAllEmployees();
    });
    super.initState();
    // final postMdl = Provider.of<EmployeeData>(context, listen: false);
    // postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Address Fetch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeList(),
    );
  }
}
