import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../database/db_helper.dart';
import '../model/bill_details_add_model.dart';
import '../model/bill_header_add_model.dart';

class SyncronizationData {

  // static Future<bool> isInternet()async{
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("Mobile data detected & internet connection confirmed.");
  //       return true;
  //     }else{
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("wifi data detected & internet connection confirmed.");
  //       return true;
  //     }else{
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   }else {
  //     print("Neither mobile data or WIFI detected, not internet connection found.");
  //     return false;
  //   }
  // }

  final conn = SqfliteDatabaseHelper.instance;

  Future<List<Bill_header_add_Model>> fetchData_from_Header()async{
    final dbClient = await conn.db;
    List<Bill_header_add_Model> header_bill_list = [];
    try {
      final maps = await dbClient!.query(SqfliteDatabaseHelper.orderHeaderTable);
      for (var item in maps) {
        header_bill_list.add(Bill_header_add_Model.fromJson(item));
      }
    } catch (e) {
      print(e.toString());
    }
    return header_bill_list;
  }

  Future<List<Bill_details_add_Model>> fetchData_from_Details()async{
    final dbClient = await conn.db;
    List<Bill_details_add_Model> details_bill_list = [];
    try {
      final maps = await dbClient!.query(SqfliteDatabaseHelper.orderDetailsTable);
      for (var item in maps) {
        details_bill_list.add(Bill_details_add_Model.fromJson(item));
      }
    } catch (e) {
      print(e.toString());
    }
    print(details_bill_list);
    return details_bill_list;
  }



  Future saveToCloud_Header(List<Bill_header_add_Model> header_List)async{
    for (var i = 0; i < header_List.length; i++) {
      print("saveToMysqlWithHeader"+"${header_List[i].xdornum.toString()}");
      final response = await http.post(Uri.parse('http://172.20.20.69/mobilepos/sendtoheader.php'),
          body: jsonEncode(<String, dynamic>{

            "xdornum": "00010122121311001",
            "xacashamt": 0,
            "xacrdamt": 0,
            "xamount": "540.00",
            "xbonuspoints": 0,
            "xcardamt": ".00",
            "xcardno": 0,
            "xcardtype": 0,
            "xcashamt": "1000.00",
            "xchange": "460.00",
            "xcus": "CUS-000000",
            "xdate": "2022-12-13 00:00:00.000000",
            "xdisc": ".00",
            "xdiscamt": ".00",
            "xdiscf": ".00",
            "xdiv": "01",
            "xexpamt": ".00",
            "xfield": "1001",
            "xnetamt": "540.00",
            "xnote": "",
            "xnote1": "",
            "xpaid": "1000.00",
            "xpaymentterm": "Cash",
            "xpaymenttype": "Casual Dine",
            "xpaytype": "Cash",
            "xperson": "0",
            "xref": "DO03OSL--00010122121311001",
            "xroundingchange": ".00",
            "xshift": "1",
            "xshopno": "OSL--0001",
            "xstatusprint": "Printed",
            "xsupptaxamt": ".00",
            "xterminal": "01",
            "xtotamt": "517.14",
            "xvatamt": "22.86",
            "xworkingdate": "2022-12-13 00:00:00.000000",
            "zauserid": "raad",
            "zid": 100000,
            "ztime": "2022-12-13 00:00:00.000000",
            "zutime": "2022-12-13 00:00:00.000000",
            "zuuserid": "raad"

            // "xdornum": header_List[i].xdornum,
            // "xacashamt": header_List[i].xdornum.toString(),
            // "xacrdamt": header_List[i].xdornum.toString(),
            // "xamount": header_List[i].xdornum.toString(),
            // "xbonuspoints": header_List[i].xdornum.toString(),
            // "xcardamt": header_List[i].xdornum.toString(),
            // "xcardno": header_List[i].xdornum.toString(),
            // "xcardtype": header_List[i].xdornum.toString(),
            // "xcashamt": header_List[i].xdornum.toString(),
            // "xchange": header_List[i].xdornum.toString(),
            // "xcus": header_List[i].xdornum.toString(),
            // "xdate": header_List[i].xdornum.toString(),
            // "xdisc": header_List[i].xdornum.toString(),
            // "xdiscamt": header_List[i].xdornum.toString(),
            // "xdiscf": header_List[i].xdornum.toString(),
            // "xdiv": header_List[i].xdornum.toString(),
            // "xexpamt": header_List[i].xdornum.toString(),
            // "xfield": header_List[i].xdornum.toString(),
            // "xnetamt": header_List[i].xdornum.toString(),
            // "xnote": header_List[i].xdornum.toString(),
            // "xnote1": header_List[i].xdornum.toString(),
            // "xpaid": header_List[i].xdornum.toString(),
            // "xpaymentterm":header_List[i].xdornum.toString(),
            // "xpaymenttype": header_List[i].xdornum.toString(),
            // "xpaytype": header_List[i].xdornum.toString(),
            // "xperson": header_List[i].xdornum.toString(),
            // "xref": header_List[i].xdornum.toString(),
            // "xroundingchange": header_List[i].xdornum.toString(),
            // "xshift": header_List[i].xdornum.toString(),
            // "xshopno": header_List[i].xdornum.toString(),
            // "xstatusprint": header_List[i].xdornum.toString(),
            // "xsupptaxamt": header_List[i].xdornum.toString(),
            // "xterminal": header_List[i].xdornum.toString(),
            // "xtotamt": header_List[i].xdornum.toString(),
            // "xvatamt": header_List[i].xdornum.toString(),
            // "xworkingdate": header_List[i].xdornum.toString(),
            // "zauserid": header_List[i].xdornum.toString(),
            // "zid": header_List[i].xdornum.toString(),
            // "ztime": header_List[i].xdornum.toString(),
            // "zutime": header_List[i].xdornum.toString(),
            // "zuuserid": header_List[i].xdornum.toString()

            //
            // "contact_id":header_List[i].id.toString(),
            // "user_id":header_List[i].userId.toString(),
            // "name":header_List[i].name,
            // "email":header_List[i].email,
            // "gender":header_List[i].gender,
            // "created_at":header_List[i].createdAt,
          })
      );
      print(response.body);
      if (response.statusCode==200) {
        print("Saving Data ");
      }else{
        print(response.statusCode);
      }
    }
  }



  Future saveToCloud_Details(List<Bill_details_add_Model> details_list)async{
    print("details_list.length");
    print(details_list.length);
    for (var i = 0; i < details_list.length; i++) {
      print("saveToMysqlWithdetails"+"${details_list[i].xdornum.toString()}");
      final response = await http.post(Uri.parse('http://172.20.20.69/mobilepos/sendtodetail.php'),
          body: jsonEncode(<String, dynamic>{
            "xdornum": "00010122121311001",
            "xrow": 1,
            "xaddonrow": 0,
            "xdisc": ".00",
            "xdiscamt": ".00",
            "xdisctype": "-Select-",
            "xdorrow": 0,
            "xitem": "00001001",
            "xlineamt": "30.00",
            "xnetamt": "30.00",
            "xnote": "null",
            "xqtyord": "1.000",
            "xrate": "30.00",
            "xshopno": "OSL--0001",
            "xstatusgl": "SERVED",
            "xsupptaxamt": ".00",
            "xsupptaxrate": ".00",
            "xterminal": "01",
            "xvatamt": ".00",
            "xvatrate": ".00",
            "zauserid": "raad",
            "zid": 100000,
            "ztime": "2022-12-13 15:34:17.916000",
            "zutime": "2022-12-13 15:34:19.256666",
            "zuuserid": "raad"

            // "xdornum": details_list[i].xdornum,
            // "xacashamt": 0,
            // "xacrdamt": 0,
            // "xamount": "540.00",
            // "xbonuspoints": 0,
            // "xcardamt": ".00",
            // "xcardno": 0,
            // "xcardtype": 0,
            // "xcashamt": "1000.00",
            // "xchange": "460.00",
            // "xcus": "CUS-000000",
            // "xdate": "2022-12-13 00:00:00.000000",
            // "xdisc": ".00",
            // "xdiscamt": ".00",
            // "xdiscf": ".00",
            // "xdiv": "01",
            // "xexpamt": ".00",
            // "xfield": "1001",
            // "xnetamt": "540.00",
            // "xnote": "",
            // "xnote1": "",
            // "xpaid": "1000.00",
            // "xpaymentterm": "Cash",
            // "xpaymenttype": "Casual Dine",
            // "xpaytype": "Cash",
            // "xperson": "0",
            // "xref": "DO03OSL--00010122121311001",
            // "xroundingchange": ".00",
            // "xshift": "1",
            // "xshopno": "OSL--0001",
            // "xstatusprint": "Printed",
            // "xsupptaxamt": ".00",
            // "xterminal": "01",
            // "xtotamt": "517.14",
            // "xvatamt": "22.86",
            // "xworkingdate": "2022-12-13 00:00:00.000000",
            // "zauserid": "raad",
            // "zid": 100000,
            // "ztime": "2022-12-13 00:00:00.000000",
            // "zutime": "2022-12-13 00:00:00.000000",
            // "zuuserid": "raad"
          })
      );
      print(response.body);
      if (response.statusCode==200) {
        print("Saving Data ");
      }else{
        print(response.statusCode);
      }
    }
  }

  
  
  
  
}