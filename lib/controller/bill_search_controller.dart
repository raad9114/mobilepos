
import 'package:http/http.dart' as http;

import '../database/db_helper.dart';
import '../model/bill_details_add_model.dart';
import '../model/bill_header_add_model.dart';
import '../model/cart_category.dart';


class Bill_Search_Controller {
  final conn = SqfliteDatabaseHelper.instance;

  // static Future<bool> isInternet() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("Mobile data detected & internet connection confirmed.");
  //       return true;
  //     } else {
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("wifi data detected & internet connection confirmed.");
  //       return true;
  //     } else {
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   } else {
  //     print(
  //         "Neither mobile data or WIFI detected, not internet connection found.");
  //     return false;
  //   }
  // }

  Future fetchData_from_Header_bill_report() async {
    var dbclient = await conn.db;
    List itemList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.orderHeaderTable);
      for (var item in maps) {
        itemList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    print(itemList);
    return itemList;
  }

  Future fetchData_from_details_by_search(String xdornum) async {
    var dbclient = await conn.db;
    print(xdornum);
    List itemList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.orderDetailsTable,  where: 'xdornum = ?', whereArgs: [xdornum]);
      for (var item in maps) {
        itemList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    print(itemList);
    return itemList;
  }


  Future getnetAmount_from_Header(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT xpaid FROM ${SqfliteDatabaseHelper.orderHeaderTable} WHERE xdornum='$xdornum'");
    print(result);
    Object? value = result[0]["xpaid"];
    return value.toString();
  }

  Future getDate_from_Header(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT xdate FROM ${SqfliteDatabaseHelper.orderHeaderTable} WHERE xdornum='$xdornum'");

    Object? value = result[0]["xdate"];
    //print(value);
    return value.toString();
  }

  Future getCustomer_from_Header(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT xcus FROM ${SqfliteDatabaseHelper.orderHeaderTable} WHERE xdornum='$xdornum'");

    Object? value = result[0]["xcus"];
    print(value);
    return value.toString();
  }

}