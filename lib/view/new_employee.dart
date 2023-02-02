// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../provider/db_provider.dart';

// class NewEmployee extends StatelessWidget {
//   const NewEmployee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//       future: DBProvider.db.getAllEmployees(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
          
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return ListView.separated(
//             separatorBuilder: (context, index) => Divider(
//               color: Colors.black12,
//             ),
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 leading: Text(
//                   "${index + 1}",
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 title: Text(
//                     "Name: ${snapshot.data[index].name} ${snapshot.data[index].username} "),
//                 subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
//               );
//             },
//           );
//         }
//       },
//     )
  
//     );
//   }
// }
