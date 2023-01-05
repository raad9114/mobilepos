import 'package:flutter/material.dart';

import '../../../controller/drawer.dart';

class Business_Details extends StatefulWidget {
  const Business_Details({Key? key}) : super(key: key);

  @override
  State<Business_Details> createState() => _Business_DetailsState();
}

class _Business_DetailsState extends State<Business_Details> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xff403B35),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "Business Details",
            style: TextStyle(
                color: Color(0xff403B35),
                fontSize: size.height / 35,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: Drawer_page(),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Business Name',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Business ID',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Outlet No',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Shop No',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Terminal No',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Phone No',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Vat Registration No',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Mushak No',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff403B35),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
