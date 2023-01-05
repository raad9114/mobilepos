import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pos_mobile_version/view/bills/Searched_bill.dart';
import '../../controller/bill_search_controller.dart';
import '../../controller/design_controller.dart';
import '../../controller/drawer.dart';
import 'package:intl/intl.dart';


class See_Bills extends StatefulWidget {
  const See_Bills({Key? key}) : super(key: key);

  @override
  State<See_Bills> createState() => _See_BillsState();
}

class _See_BillsState extends State<See_Bills> {
  String xdornum = '';

  late List bill_list = [];
  bool loading = true;
  Future bill_List()async{
    bill_list = await Bill_Search_Controller().fetchData_from_Header_bill_report();
    setState(() {loading=false;});
    //print(list);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bill_List();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "BILLS",
            style: TextStyle(
                color: Color(0xff403B35),
                fontSize: size.height / 35,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xff403B35),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        drawer: Drawer_page(),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        onChanged: (input) {
                          xdornum = input;
                        },
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Empty";
                          }
                        },
//                         inputFormatters: <TextInputFormatter>[
//                           // for below version 2 use this
//                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// // for version 2 and greater youcan also use this
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20), // add padding to adjust text
                          isDense: false,
                          hintText: "Enter Invoice Code",
                          labelText: "Invoice Code",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          // suffixIcon: Icon(
                          //   Icons.category,
                          //   size: 35,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Searched_Bill(
                          xdornum: xdornum,
                        )));
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Design_Controller().button_up,
                              Design_Controller().button_down,
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "SEARCH",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ), SizedBox(
                  height: 20,
                ),
                Text(
                  "Today's Invoice List",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Invoice No",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: size.height / 43,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Amount",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: size.height / 43,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: size.height / 43,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: bill_list.length==null?0:bill_list.length,
                      // itemCount: detailslist.length==null?0:detailslist.length,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: FittedBox(
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Text(
                                        "${bill_list[index]['xdornum']}",
                                        style: TextStyle(
                                            color: Color(0xff403B35),
                                            fontSize: size.height / 45,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${bill_list[index]['xpaid']}",
                                  style: TextStyle(
                                      color: Color(0xff403B35),
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "${(DateFormat.jms().format(DateTime.parse(bill_list[index]['xdate'])))}",
                                  //"${(bill_list[index]['xdate'])}",
                                  style: TextStyle(
                                      color: Color(0xff403B35),
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
