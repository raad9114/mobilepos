import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controller/bill_search_controller.dart';
import '../../controller/drawer.dart';

class Searched_Bill extends StatefulWidget {

  Searched_Bill({required this.xdornum});
  String xdornum;

  @override
  State<Searched_Bill> createState() => _Searched_BillState();
}

class _Searched_BillState extends State<Searched_Bill> {


  late List detailslist = [];
  Future detailsList_by_searc()async{
    detailslist = await Bill_Search_Controller().fetchData_from_details_by_search(widget.xdornum);
    print("detailslist");
    // print(detailslist);
    //setState(() {loading=false;});
    //print(list);
  }

  String netPayable = "0";
  String date = "2022-12-28 13:09:45.802366";
  String customer = '';

  Future netPayCalculation()async{
    netPayable = await Bill_Search_Controller().getnetAmount_from_Header(widget.xdornum);
  }

  Future getDate()async{
    date = await Bill_Search_Controller().getDate_from_Header(widget.xdornum);
  }

  Future getCustomer_mobile()async{
    customer = await Bill_Search_Controller().getCustomer_from_Header(widget.xdornum);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsList_by_searc();
    netPayCalculation();
    getDate();
    getCustomer_mobile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "INVOICE DETAILS",
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
                Text(
                  "Invoice No: ${widget.xdornum}",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Customer Mobile: $customer",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Total Amount: ${netPayable}",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.normal),
                ),
                Text(

                  "Time: ${(DateFormat.jms().format(DateTime.parse(date)))}",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Cashier: ",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.normal),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item Name",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: size.height / 43,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: size.height / 43,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: size.height / 43,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: detailslist.length==null?0:detailslist.length,
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
                                        "${detailslist[index]['xdesc']}",
                                        style: TextStyle(
                                            color: Color(0xff403B35),
                                            fontSize: size.height / 45,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${detailslist[index]['xqtyord']}",
                                  style: TextStyle(
                                      color: Color(0xff403B35),
                                      fontSize: size.height / 45,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "${detailslist[index]['xrate']}",
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
