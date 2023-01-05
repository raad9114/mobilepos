import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos_mobile_version/controller/cart_controller.dart';
import '../../controller/controller.dart';
import '../../controller/design_controller.dart';
import '../../model/cart_category.dart';
import '../../model/food_category.dart';
import '../../model/fooddata.dart';
import 'cart_screen.dart';
import 'package:collection/collection.dart';


class POS extends StatefulWidget {
  const POS({Key? key}) : super(key: key);

  @override
  State<POS> createState() => _POSState();
}

class _POSState extends State<POS> {

  late List itemlist = [];
  bool loading = true;
  Future productList()async{
    itemlist = await Controller().fetchData();
    setState(() {loading=false;});
    //print(list);
  }

  late List cartlist = [];
  Future cartList()async{
    cartlist = await Controller().fetchData_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  List categorylist = [];
  Future categoryList()async{
    categorylist = await Controller().fetchcategory();
    setState(() {loading=false;});
    //print(list);
  }

  String sumFromCart = "0";
  Future getSumFromCart()async{
    sumFromCart = await Controller().getTotal_from_cart();
    setState(() {loading=false;});
    print(sumFromCart);
  }

  //
  // List categorylist1 = [
  //   'Burger',
  //   'Cake',
  //   'Drinks',
  //   'Pizza',
  //   'Sandwich',
  //   'Sides'
  // ];
  // List myproductsprice = ['210', '120', '30', '780', '209', '99'];
  //

  // late Future<List<ItemInfoModel>> allfood;
  // Future<List<ItemInfoModel>>  all_food() async {
  //   var response = await http.post(Uri.parse("http://172.20.20.69/mobilepos/food_data.php"),
  //     body:jsonEncode(<String,String>{
  //       "zid":"100000",
  //     }),
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed
  //         .map<ItemInfoModel>((json) => ItemInfoModel.fromJson(json))
  //         .toList();
  //
  //   } else {
  //     throw Exception('Failed to fetch Data');
  //   }
  // }
  //
  //
  // late Future<List<FoodCategory>> category;
  // Future<List<FoodCategory>> find_category() async{
  //   var response = await http.post(
  //       Uri.parse(
  //           'http://172.20.20.69/mobilepos/category_fetch.php'),
  //       body: jsonEncode(<String, String>{
  //         "zid":"100000",
  //       }));
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed
  //         .map<FoodCategory>((json) => FoodCategory.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to fetch Data');
  //   }
  //
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // find_category();
    // category=find_category();
    // all_food();
    // allfood=all_food();
    print("acac");
    productList();
    categoryList();
    cartList();
    getSumFromCart();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          print("call");
          productList();
          categoryList();
          cartList();
          getSumFromCart();
          return true;
        },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "POS",
            style: GoogleFonts.lato(
                color: Color(0xff403B35),
                fontSize: size.height / 35,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Cart_Screen()));

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Cart_Screen()));

          },
          label: Text("${cartlist.length==null?0:cartlist.length} Items - ${sumFromCart=="null"?0:sumFromCart} TAKA",
            style: TextStyle(
                color: Colors.white,
                fontSize: size.height / 40,
                fontWeight: FontWeight.normal
            ),
          ),

          backgroundColor: Color(0xffF94F50),

          // foregroundColor: Colors.white,
          // splashColor: Colors.orange,
          // hoverColor: Colors.purple,
          // focusColor: Colors.green,
          // autoFocus: true,

        ),

        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,

            color: Color(0xffF3F4F6),
            padding: EdgeInsets.all(8),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Category",
                //   style: TextStyle(
                //     fontSize: size.height / 40,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Container(
                //   height: size.height / 15,
                //   child: ListView.builder(
                //     physics: ClampingScrollPhysics(),
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: categorylist.length==null?0:categorylist.length,
                //     itemBuilder: (BuildContext context, int index) => Padding(
                //       padding: const EdgeInsets.only(left: 2.0, right: 2),
                //       child: Card(
                //         shape: const StadiumBorder(),
                //         elevation: 3,
                //         shadowColor: Design_Controller().button_down.withOpacity(0.5),
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: FittedBox(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 // Image(
                //                 //   height: size.height / 45,
                //                 //   image: AssetImage(
                //                 //       'images/category/${categorylist[index]}.png'),
                //                 // ),
                //                 // Icon(Icons.local_pizza, color: Design_Controller().button_down,),
                //                 Text(
                //                   '${categorylist[index]['xcitem']}',
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     // color: Design_Controller().button_down,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Text(
                  "Items",
                  style: TextStyle(
                   // color: Design_Controller().button_down,
                    fontSize: size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height / 1.2,
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: size.width / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: itemlist.length==null?0:itemlist.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () async{
                            // setState(() {
                            //   ordered_name.add(featured[index]);
                            //   ordered_img.add(imagesfeatured[index]);
                            //   ordered_price.add(price[index]);
                            //   totalamt();
                            // });

                            // setState((){
                            //   Cart_controller().ordered_price.add(itemlist[index]['xrate']);
                            //   Cart_controller().ordered_product.add(itemlist[index]['xdesc']);
                            // });
                            // print(Cart_controller().ordered_price);

                            print(itemlist[index]["xdisc"]);
                            print(itemlist[index]["xvatamt"]);
                            print(itemlist[index]["xrate"]);

                            Cart_add_Model cart_add_model = Cart_add_Model(
                                xitem: itemlist[index]['xitem'],
                                id: null,
                                xdesc: itemlist[index]['xdesc'],
                                product_qnty: '1',
                                xrate: itemlist[index]['xrate'],
                                xlineamt: itemlist[index]['xrate'],
                                xdisc: itemlist[index]["xdisc"],
                                xvatamt: itemlist[index]["xvatamt"],
                                xsupptaxamt: itemlist[index]["xsupptaxamt"],//sd data
                            );
                            await Controller().addDatatToCart(cart_add_model).then((value){
                              if (value>0) {
                                print("Success");
                              }else{
                                print("Failed");
                              }

                            });
                            cartList();
                            getSumFromCart();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Design_Controller().button_down.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              // color:
                              //     Design_Controller().button_down.withOpacity(0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    height: size.height / 10,
                                    image: AssetImage(
                                        'images/category/Cake.png'),
                                  ),
                                  Text(
                                    itemlist[index]['xdesc'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(MdiIcons.currencyBdt, color: Design_Controller().button_down,size:26,),
                                      Text(
                                        "${itemlist[index]['xrate']}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Design_Controller().button_down),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
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
