import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:ecommerce_app/screen/product/product_screen.dart';
import 'package:ecommerce_app/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectCategory = "all";
  bool isMobile = true, isLaptop = true, isWatch = true, isTelevision = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              "Ecommerce App",
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
            actions:  [
              InkWell(
                  onTap:() {
                    Navigator.pushNamed(context,"cart");
                  },
                  child: Icon(Icons.shopping_cart, color: Colors.black)
              ),
             ]
            ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              DropdownButton(
                value: selectCategory,
                items: const [
                  DropdownMenuItem(child: Text("All"), value: "all"),
                  DropdownMenuItem(child: Text("Mobile"), value: "mobile"),
                  DropdownMenuItem(child: Text("Laptop"), value: "laptop"),
                  DropdownMenuItem(child: Text("Watch"), value: "watch"),
                  DropdownMenuItem(child: Text("Television"), value: "television"),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectCategory = value;
                    if(value=="mobile")
                      {
                        isMobile = true;
                        isLaptop = false;
                        isWatch = false;
                        isTelevision = false;
                      }
                    else if(value=="laptop")
                      {
                        isMobile = false;
                        isLaptop = true;
                        isWatch = false;
                        isTelevision = false;
                      }
                    else if(value=="watch")
                    {
                      isMobile = false;
                      isLaptop = false;
                      isWatch = true;
                      isTelevision = false;
                    }
                    else if(value=="television")
                    {
                      isMobile = false;
                      isLaptop = false;
                      isWatch = false;
                      isTelevision = true;
                    }
                    else
                    {
                      isMobile = true;
                      isLaptop = true;
                      isWatch = true;
                      isTelevision = true;
                    }
                  });
                },
              ),
                const SizedBox(
                height: 10,
              ),
                  Visibility(
                visible: isMobile,
                child: Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: isMobile,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      productList.length,
                      (index) => InkWell(
                        onTap: () {
                          Map m1 = productList[index];
                          Navigator.pushNamed(context, 'product',
                              arguments: m1);
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5
                                )
                              ]),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                  visible: isMobile,
                                  child: Image.asset(
                                      "${productList[index]['image']}",
                                      height: 80,
                                      width: 150
                                  )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: isMobile,
                                child: Text(
                                  "${productList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                visible: isMobile,
                                child: Text(
                                  "${productList[index]['price']}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.orange),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isMobile,
                                    child: Text(
                                      "${productList[index]['category']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isMobile,
                                    child: Text(
                                      "${productList[index]['rate']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               Visibility(
                visible: isLaptop,
                child: const Text(
                  "Laptop",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: isLaptop,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      laptopList.length,
                      (index) => InkWell(
                        onTap: () {
                          Map m1 = laptopList[index];
                          Navigator.pushNamed(context, 'product',
                              arguments: m1);
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                  visible: isLaptop,
                                  child: Image.asset(
                                      "${laptopList[index]['image']}",
                                      height: 80,
                                      width: 150)),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: isLaptop,
                                child: Text(
                                  "${laptopList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                visible: isLaptop,
                                child: Text(
                                  "${laptopList[index]['price']}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.orange),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: isLaptop,
                                    child: Text(
                                      "${laptopList[index]['category']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                    ),
                                  ),
                                  Text(
                                    "${laptopList[index]['rate']}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),



               Visibility(
                visible: isWatch,
                child: Text(
                  "Watch",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: isWatch,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        watchList.length,
                        (index) => InkWell(
                          onTap: () {
                            Map m1 = watchList[index];
                            Navigator.pushNamed(context, 'product',
                                arguments: m1);
                          },
                          child: Container(
                            height: 180,
                            width: 150,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            alignment: Alignment.center,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                      visible: isWatch,
                                      child: Image.asset(
                                          "${watchList[index]['image']}",
                                          height: 80,
                                          width: 150)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${watchList[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${watchList[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.orange),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${watchList[index]['category']}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.blueGrey),
                                      ),
                                      Text(
                                        "${watchList[index]['rate']}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: isTelevision,
                child: const Text(
                  "Television",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Visibility(
                visible: isTelevision,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      televisionList.length,
                      (index) => InkWell(
                        onTap: () {
                          Map m1 = televisionList[index];
                          Navigator.pushNamed(context, 'product',
                              arguments: m1);
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          alignment: Alignment.center,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: isTelevision,
                                  child: Image.asset("${televisionList[index]['image']}",
                                      height: 80, width: 150),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${televisionList[index]['name']}",
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${televisionList[index]['price']}",
                                  style:
                                      const TextStyle(fontSize: 16, color: Colors.orange),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${televisionList[index]['category']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                    ),
                                    Text(
                                      "${televisionList[index]['rate']}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
