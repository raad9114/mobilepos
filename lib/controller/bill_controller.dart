
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;

import '../database/db_helper.dart';
import '../model/bill_details_add_model.dart';
import '../model/bill_header_add_model.dart';
import '../model/cart_category.dart';


class Bill_Controller {
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

  //
  // Future saveToMysqlWith_details(List<Bill_details_add_Model> bill_details)async{
  //   for (var i = 0; i < bill_details.length; i++) {
  //     print("saveToMysqlWith"+"${bill_details[i].name.toString()}");
  //     final response = await http.post(Uri.parse('http://172.20.20.69/pick_kids_test/insert.php'),
  //         body: jsonEncode(<String, dynamic>{
  //           "contact_id":bill_details[i].id.toString(),
  //           "user_id":bill_details[i].userId.toString(),
  //           "name":bill_details[i].name,
  //           "email":bill_details[i].email,
  //           "gender":bill_details[i].gender,
  //           "created_at":bill_details[i].createdAt,
  //         })
  //     );
  //     print(response.body);
  //     if (response.statusCode==200) {
  //       print("Saving Data ");
  //     }else{
  //       print(response.statusCode);
  //     }
  //   }
  // }
  //
  // Future saveToMysqlWith_header(List<Bill_header_add_Model> bill_header)async{
  //   for (var i = 0; i < bill_header.length; i++) {
  //     print("saveToMysqlWith"+"${bill_header[i].name.toString()}");
  //     final response = await http.post(Uri.parse('http://172.20.20.69/pick_kids_test/insert.php'),
  //         body: jsonEncode(<String, dynamic>{
  //           "contact_id":bill_header[i].id.toString(),
  //           "user_id":bill_header[i].userId.toString(),
  //           "name":bill_header[i].name,
  //           "email":bill_header[i].email,
  //           "gender":bill_header[i].gender,
  //           "created_at":bill_header[i].createdAt,
  //         })
  //     );
  //     print(response.body);
  //     if (response.statusCode==200) {
  //       print("Saving Data ");
  //     }else{
  //       print(response.statusCode);
  //     }
  //   }
  // }
  //




  // Future<int> addData(ContactinfoModel contactinfoModel) async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.insert(
  //         SqfliteDatabaseHelper.contactinfoTable, contactinfoModel.toJson());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }
  //
  // Future<int> deleteData() async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.delete(
  //         SqfliteDatabaseHelper.contactinfoTable);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }
  //
  // Future<int> updateData(ContactinfoModel contactinfoModel) async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.update(
  //         SqfliteDatabaseHelper.contactinfoTable, contactinfoModel.toJson(),
  //         where: 'id=?', whereArgs: [contactinfoModel.id]);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }






  /////////////////////////////////////////////////////////////////////////////////////
  // Future fetchData() async {
  //   var dbclient = await conn.db;
  //   List itemList = [];
  //   try {
  //     List<Map<String, dynamic>> maps = await dbclient!.query(
  //         SqfliteDatabaseHelper.productTable, orderBy: 'id DESC');
  //     for (var item in maps) {
  //       itemList.add(item);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return itemList;
  // }
  //
  //
  // Future fetchcategory() async {
  //   var dbclient = await conn.db;
  //   List categoryList = [];
  //   try {
  //     List<Map<String, dynamic>> maps = await dbclient!.query(
  //         SqfliteDatabaseHelper.productTable, groupBy: 'xcitem');
  //     for (var item in maps) {
  //       categoryList.add(item);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return categoryList;
  // }



  Future<int> addDatatToBillHeader(Bill_header_add_Model bill_header_add_model) async {
    var dbclient = await conn.db;
    int result = 0;
    try {
      result = await dbclient!.insert(
          SqfliteDatabaseHelper.orderHeaderTable, bill_header_add_model.toJson());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }


  Future<int> addDatatToBilldetails(Bill_details_add_Model bill_details_add_model) async {
    var dbclient = await conn.db;
    int result = 0;
    try {
      result = await dbclient!.insert(
          SqfliteDatabaseHelper.orderDetailsTable, bill_details_add_model.toJson());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }


  Future cart_to_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery(
        "INSERT INTO ${SqfliteDatabaseHelper.orderDetailsTable} (xdornum,xitem,xdesc,xrate,xlineamt, xqtyord,xdisc,xvatamt,xsupptaxamt )  SELECT '$xdornum', xitem,xdesc,xrate,xlineamt, product_qnty,xdisc,xvatamt,xsupptaxamt  FROM ${SqfliteDatabaseHelper.cartTable}"
    );

    print("object cart");
    print(result);

    //Object? value = result[0]["Insert"];
   // return value.toString();
  }


  Future fetchData_from_Header(String xdornum) async {
    var dbclient = await conn.db;
    print(xdornum);
    List itemList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.orderHeaderTable, where: 'xdornum=?', whereArgs: [xdornum]);
      for (var item in maps) {
        itemList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    print(itemList);
    return itemList;
  }

  Future fetchData_from_details(String xdornum) async {
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



  Future getTotal_from_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xlineamt) FROM ${SqfliteDatabaseHelper.orderDetailsTable} WHERE xdornum='$xdornum'");
    Object? value = result[0]["SUM(xlineamt)"];
    return value.toString();
  }

  Future getDiscount_from_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xdisc) FROM ${SqfliteDatabaseHelper.orderDetailsTable} WHERE xdornum='$xdornum'");
    Object? value = result[0]["SUM(xdisc)"];
    return value.toString();
  }

  Future getVat_from_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xvatamt) FROM ${SqfliteDatabaseHelper.orderDetailsTable} WHERE xdornum='$xdornum'");
    Object? value = result[0]["SUM(xvatamt)"];
    return value.toString();
  }

  Future getSD_from_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xsupptaxamt) FROM ${SqfliteDatabaseHelper.orderDetailsTable} WHERE xdornum='$xdornum'");
    Object? value = result[0]["SUM(xsupptaxamt)"];
    return value.toString();
  }

  Future getnetAmount_from_Details(String xdornum) async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT (SUM(xlineamt) + SUM(xvatamt) - SUM(xdisc)) AS sum FROM ${SqfliteDatabaseHelper.orderDetailsTable} WHERE xdornum='$xdornum'");
    print(result);
    Object? value = result[0]["sum"];
    return value.toString();
  }


}