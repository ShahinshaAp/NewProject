import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../helper/themes.dart';
import '../model/user_data_modell.dart';
import '../model/user_data_response_model.dart';
import 'db_provider.dart';

class EmployeeData extends ChangeNotifier {
  List<UserdDataModel?> post = [];
  bool loading = false;

  UserdDataModel? findByid(int id) {
    // ignore: unrelated_type_equality_checks
    return post.firstWhere((prod) => prod?.id == id);
  }

  // Future<List<UserdDataModel?>> getAllEmployees() async {
  //   List<UserdDataModel?> tempp = [];
  //   var url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
  //   var response = await http.get(url);
  //   if (response.body == 200) {
  //     print("found");
  //     List<UserdDataModel?> temp = (response as List).map((employee) {
  //       print('Inserting $employee');
  //       DBProvider.db.createEmployee(UserdDataModel.fromJson(employee));
  //     }).toList();
  //     return temp;
  //   } else {
  //     print("not Founnd");
  //     return tempp;
  //   }
  // }

  Future<UserDataResponseModel?> getSinglePostData(context) async {
    var url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        
        var item = json.decode(response.body);
        for(var items in item){
           Themes.saveUserData(items);
        }
        List<UserdDataModel?> temp =
            (item as List).map((e) => UserdDataModel.fromJson(e)).toList();

        final result = UserDataResponseModel(response: temp);

        return result;
       
      } else {
        print("not Added");
        return null;
        
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
   
  }

  static Future<List<UserdDataModel>> searchResult(String search) async {
    final url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List user = json.decode(response.body);
      return user.map((json) => UserdDataModel.fromJson(json)).where((user) {
        final name = user.name!.toLowerCase();
        final email = user.email!.toLowerCase();
        final searchtext = search.toLowerCase();
        return email.contains(searchtext) || name.contains(searchtext);
      }).toList();
    } else {
      throw Exception();
    }
  }

  getPostData(context) async {
    loading = true;
    final response = await getSinglePostData(context);
    if (response?.response != null && response!.response!.isNotEmpty) {
      post.addAll(response.response!);
      
    }
    loading = false;

    notifyListeners();
  }
}
