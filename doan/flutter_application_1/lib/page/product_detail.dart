//import 'dart:html';
// ignore_for_file: unused_import, file_names, prefer_const_constructors, sized_box_for_whitespace, unused_field, duplicate_import, unused_local_variable

import 'package:flutter_application_1/Models/SanPhamYeuThich.dart';
import 'package:flutter_application_1/Models/mau.dart';
import 'package:flutter_application_1/Models/size.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_binhluan_index.dart';
import 'package:flutter_application_1/api/api_chitiet.dart';
import 'package:flutter_application_1/api/api_giohang_index.dart';
import 'package:flutter_application_1/api/api_yeuthich_xoa.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/api/api_giohang_create.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

import '../appbar/cart.dart';
import '../appbar/favorite.dart';
import '../appbar/notification.dart';
import '../bottom/account.dart';
import '../bottom/chat.dart';
import '../bottom/home.dart';
import '../bottom/setting.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Models/product.dart';
import '../Models/Product_main.dart';
import 'package:flutter_application_1/api/api_sanphamyeuthich_them.dart';

import '../Navbar.dart';
import 'cmt.dart';
// import '../Page/products.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product_main product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentTab = 0;
  String dropdownValueSize = 'Kích cỡ';
  String dropdownValueMau = 'Màu';
  late String valuechoose;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSceent = Home();

  // List listmau = ["Xanh", "Đỏ", "Tím", "Vàng"];

  Future<SanPhamYeuThich>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    var apiThem = Provider.of<ApiThemGioHang>(context, listen: false);
    var apigh = Provider.of<ApiGioHang>(context, listen: false);
    Provider.of<APICMT>(context, listen: false).BinhLuan(widget.product);
    var apibl = Provider.of<APICMT>(context, listen: false);
    Provider.of<ApiCT>(context, listen: false).fetchProduct_CT();
    var api = Provider.of<ApiCT>(context, listen: false);
    List<Mau> listmau = api.lstmau;
    List<size> listsize = api.lstsize;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: Text(
        //   widget.title,
        //   style: const TextStyle(color: Colors.white),
        // ),
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
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => Notifi()),
          //       );
          //       currentTab = 4;
          //     });
          //   },
          //   icon: const Icon(Icons.notifications_none),
          //   color: currentTab == 4 ? Colors.red : Colors.white,
          // ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Favorite()),
                );
                currentTab = 5;
              });
            },
            icon: const Icon(Icons.favorite),
            color: currentTab == 5 ? Colors.red : Colors.white,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Cart()),
                );
                currentTab = 6;
              });
            },
            icon: const Icon(Icons.shopping_cart),
            color: currentTab == 6 ? Colors.red : Colors.white,
          )
        ],
      ),
      // body:   Container(
      //     alignment: Alignment.center,
      //     padding: const EdgeInsets.all(8.0),
      //     child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      //   ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
            child: SizedBox(
          height: 1500,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    // height: 5000,
                    // margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: 30.0,
                    ),
                    color: Colors.greenAccent,

                    child: SizedBox(
                      height: 500,
                      width: double.infinity,
                      // width:  Curves.easeInOut.transform(1) * 5000,
                      child: Stack(
                        children: <Widget>[
                          // Hình sản phẩn
                          Positioned(
                            right: 50,
                            left: 50,
                            child: Image(
                              height: 400,
                              width: 400,
                              image:
                                  AssetImage('assets' + widget.product.hinhAnh),
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Giá sản phẩm
                          Positioned(
                            bottom: 5,
                            left: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${widget.product.gia} VNĐ',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Tên sản phẩm
                          Positioned(
                            bottom: 50,
                            left: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 5.0),
                                Text(
                                  widget.product.tenSanPham,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //chọn màu
                          Positioned(
                              right: 50,
                              bottom: 5,
                              child:
                                  Consumer<ApiCT>(builder: (_, value, child) {
                                return Container(
                                  height: 30,
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
                                    value: dropdownValueMau,
                                    dropdownColor: Colors.pink[50],
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    isExpanded: true,
                                    elevation: 16,
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                    ),
                                    underline: SizedBox(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValueMau = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Màu',
                                      listmau[1].tenmau,
                                      listmau[0].tenmau,
                                      listmau[2].tenmau,
                                      listmau[3].tenmau,
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                );
                              })),
                          // chọn size
                          Positioned(
                            bottom: 50,
                            right: 50,
                            child: Container(
                              height: 30,
                              width: 150,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton(
                                dropdownColor: Colors.pink[50],
                                underline: SizedBox(),
                                value: dropdownValueSize,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                isExpanded: true,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValueSize = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Kích cỡ',
                                  listsize[0].tenSize,
                                  listsize[1].tenSize,
                                  listsize[2].tenSize,
                                  listsize[3].tenSize,
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   right: 10,
                    //   bottom: 100,
                    //   top: 10,
                    //   left: 10,
                    //   child: Hero(
                    //     tag: widget.product.ImgUrl,
                    //     child: Image(
                    //       height: 200,
                    //       width: 200,
                    //       image: AssetImage(
                    //           'assets/images/' + widget.product.ImgUrl),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              // Nút thao tác
              Container(
                margin: EdgeInsets.all(50),
                height: 870,
                transform: Matrix4.translationValues(0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Mua ngay
                    Container(
                      height: 80,
                      width: 1000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: FavoriteWidget(
                              product: widget.product,
                            ),
                          ),
                          Positioned(
                            left: 450,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                setState(() {
                                  apiThem.ThemGioHang(
                                      Auth.user.id, widget.product.id, 1);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Cart(),
                                    ),
                                  );
                                });
                              },
                              child: Text(
                                'Mua ngay',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          // Bình luận chưa gắn vào
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageBinhLuan(
                                              product: widget.product,
                                            )));
                              },
                              child: Text(
                                'Bình luận',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          // ElevatedButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       Provider.of<APIThemSPYT>(context, listen: false).ThemSPyeuthich(1,widget.product.id);
                          //     });
                          //   },
                          //   child: const Text('Create Data'),
                          // ),
                        ],
                      ),
                    ),

                    Container(
                      height: 50,
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.yellow,
                              ),
                              onPressed: () {
                                setState(() {
                                  apiThem.ThemGioHang(
                                      Auth.user.id, widget.product.id, 1);
                                  apigh.fetchgiohang();
                                });
                              },
                              child: Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: 40.0,
                        ),
                        child: SizedBox(
                          height: 132,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Mô tả sản phẩm',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                widget.product.moTa,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        top: 30.0,
                      ),
                      child: Text(
                        'Bình luận',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        top: 10.0,
                      ),
                      child: Consumer<APICMT>(builder: (_, value, child) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            height: 500,
                            child: ListView(
                              addAutomaticKeepAlives: false,
                              children:
                                  List.generate(apibl.lst.length, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: GestureDetector(
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          margin: const EdgeInsets.all(5),
                                          child: SizedBox(
                                            height:
                                                Curves.easeInOut.transform(1) *
                                                    50,
                                            width:
                                                Curves.easeInOut.transform(1) *
                                                    300,
                                            child: Stack(
                                              children: <Widget>[
                                                Text(
                                                  apibl.lst[index].noiDung,
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ));
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Home()),
                    );
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Trang chủ',
                      style: TextStyle(
                          color: currentTab == 0 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    // currentSceent = Chat();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      color: currentTab == 1 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                          color: currentTab == 1 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              ),
              // MaterialButton(
              //   minWidth: 40,
              //   onPressed: () {
              //     setState(() {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (_) => Setting()),
              //       );
              //       currentTab = 2;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.settings,
              //         color: currentTab == 2 ? Colors.blue : Colors.green,
              //       ),
              //       Text(
              //         'Setting',
              //         style: TextStyle(
              //             color: currentTab == 2 ? Colors.blue : Colors.green),
              //       ),
              //     ],
              //   ),
              // ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    //currentSceent = AccountS();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AccountS()),
                    );
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.manage_accounts,
                      color: currentTab == 3 ? Colors.blue : Colors.green,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: currentTab == 3 ? Colors.blue : Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Column buildColumn() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _futureAlbum = Provider.of<APIXoaSPYT>(context, listen: false)
  //                 .XoaSPYT(widget.product);
  //           });
  //         },
  //         child: const Text('Xóa'),
  //       ),
  //     ],
  //   );
  // }

  // FutureBuilder<SanPhamYeuThich> buildFutureBuilder() {
  //   return FutureBuilder<SanPhamYeuThich>(
  //     future: _futureAlbum,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data!.id.toString());
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }

  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}
