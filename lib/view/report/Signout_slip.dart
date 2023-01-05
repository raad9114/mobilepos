import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
class Signout_Slip extends StatefulWidget {
  const Signout_Slip({Key? key}) : super(key: key);

  @override
  State<Signout_Slip> createState() => _Signout_SlipState();
}

class _Signout_SlipState extends State<Signout_Slip> {
  String date  = '';
  String time = '';
  datetimeofprint() {
    var now = DateTime.now();
    date = DateFormat.yMMMMd().format(now);
    time = (DateFormat.jms().format(now));
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "Bill",
          style: TextStyle(
              color: Color(0xff403B35),
              fontSize: size.height / 35,
              fontWeight: FontWeight.normal),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BAO",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 30,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Chef's Table, Satarkul",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),

                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hotline:",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text(" 0125362",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TAX INVOICE:",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("23456",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terminal: ",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("Cashier",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.w100),
                  ),
                  Text("Shift: ",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("Sign IN Time",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.w100),
                  ),
                  Text("Sign Out Time",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Text("Summary of Sales",style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: size.height / 43,
                  fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sales Total",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(-)Discounted Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(+)Vat Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(+)SD Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(+)Service Charge",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Rounding Total",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text(":",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("12345",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Sales Total",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text(":",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("12345",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Sales Total",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text(":",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("12345",style: TextStyle(
              //         color: Color(0xff000000),
              //         fontSize: size.height / 43,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),




              Divider(
                thickness: 2,
                color: Colors.black,

              ),






              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Gross Total",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("34",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),



              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Text("Summary of Income",style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: size.height / 43,
                  fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Due Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cash Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Master Card",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Amex",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nexus",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("City",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("BKash",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Visa",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Foodpanda",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shohoz",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),

                  Text("12345",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),






              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Total Income",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("34",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),



              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Text("Net Analysis",style: TextStyle(
                  color: Color(0xff403B35),
                  fontSize: size.height / 45,
                  fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Net Sales",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ), Text("23",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Customer Count",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ), Text("23",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),



              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Orange POS Powered by Orange Solution Ltd.",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 47,
                      fontWeight: FontWeight.normal),
                  ),

                ],
              ),



            ],
          ),
        ),

      ),
    ));
  }
}
