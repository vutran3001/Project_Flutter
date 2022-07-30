// ignore_for_file: file_names, unused_import, camel_case_types, non_constant_identifier_names, unused_field, prefer_final_fields, unused_element, unnecessary_const, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, empty_statements, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_application_1/api/api_SapXep.dart';
// import 'package:flutter_application_1/api/api_sanpham_index.dart';
import 'package:flutter_application_1/api/api_sanpham_trangsuc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import 'product_detail.dart';
import 'products.dart';

import '../appbar/cart.dart';
import '../appbar/favorite.dart';
import '../appbar/notification.dart';
import '../bottom/account.dart';
import '../bottom/chat.dart';
import '../bottom/home.dart';
import '../bottom/setting.dart';
import '../Navbar.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'product_Tui_Sach.dart';

class Product_TrangSuc_screen extends StatefulWidget {
  const Product_TrangSuc_screen({Key? key}) : super(key: key);

  @override
  _Product_TrangSuc_screen createState() => _Product_TrangSuc_screen();
}

class _Product_TrangSuc_screen extends State<Product_TrangSuc_screen>
    with SingleTickerProviderStateMixin {
  late PageController _Product_Tui_Sach1;
  late PageController _Product_Tui_Sach2;
  int _selectedPage = 0;
  int currentTab = 0;
  String dropdownValue = 'Sắp Xếp';
  // String dropdownValue2 = 'Bộ lọc';
  Widget currentSceent = Home();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<Apitrangsuc>(context, listen: false).fetchProduct_trangsuc();
    // var api = Provider.of<Apitrangsuc>(context, listen: false);
    //  Provider.of<ApiSapXep>(context,listen: false).SapXepTrangSuc('A-Z');//SapXepTrangSuc('A-Z');
    var apiSapXep = Provider.of<Apitrangsuc>(context, listen: false);
     apiSapXep.SapXepTrangSuc(dropdownValue);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,

        // leading: IconButton(
        // icon: const Icon(Icons.menu),
        //  color: Colors.green,
        // onPressed: () {},
        // ),

        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(Icons.search),
            // color: Colors.green,
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currentSceent = Notifi();
          //       currentTab = 4;
          //     });
          //   },
          //   icon: const Icon(Icons.notifications_none),
          //   color: currentTab == 4 ? Colors.red : Colors.white,
          // ),
          IconButton(
            onPressed: () {
              setState(() {
                currentSceent = Favorite();
                currentTab = 5;
              });
            },
            icon: const Icon(Icons.favorite),
            color: currentTab == 5 ? Colors.red : Colors.white,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentSceent = Cart();
                currentTab = 6;
              });
            },
            icon: const Icon(Icons.shopping_cart),
            color: currentTab == 6 ? Colors.red : Colors.white,
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(microseconds: 1000),
                viewportFraction: 0.8,
              ),
              items: [
                Banner('images/anh1.jpg'),
                Banner('images/anh2.jpeg'),
                Banner('images/anh3.jpg')
              ],
            ),
            // button
            Padding(
              padding: EdgeInsets.only(
                left: 200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,

                      dropdownColor: Colors.pink[50],
                      underline: SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      isExpanded: true,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                      ),
                      //Hiện các loại sắp xếp
                      items: <String>[
                        'Sắp Xếp',
                        'A-Z',
                        'Z-A',
                        'Giá cao',
                        'Giá thấp',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            dropdownValue = newValue!;
                            apiSapXep.SapXepTrangSuc(dropdownValue);
                            // apiSapXep.fetchProduct_trangsuc();
                            // Navigator.pop(context);

                            // Navigator.push(
                            //   context,
                            //   PageRouteBuilder(
                            //      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            //         // Product_TrangSuc_screen();
                            //         return Product_TrangSuc_screen();
                            //         },
                            //   ),
                            // );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // het button
            Expanded(
              child: Consumer<Apitrangsuc>(
                builder: (_, value, child) {
                  return GridView.count(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 50,
                    ),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: List.generate(
                      apiSapXep.lst.length,
                      (index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailScreen(
                                      product: apiSapXep.lst[index]),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: Curves.easeInOut.transform(1) * 600,
                                    width: Curves.easeInOut.transform(1) * 300,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 10,
                                          bottom: 40,
                                          left: 10,
                                          right: 10,
                                          child: Image(
                                            height: 130,
                                            width: 150,
                                            image: AssetImage(
                                              'assets' +
                                                  apiSapXep.lst[index].hinhAnh,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left: 10.0,
                                          bottom: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '${apiSapXep.lst[index].gia} VNĐ',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 17.0,
                                          left: 10.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(height: 5.0),
                                              Text(
                                                apiSapXep.lst[index].tenSanPham,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container Banner(String link) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(link),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
