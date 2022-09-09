import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laundry_app/customobjects/service_prices.dart';
import 'package:laundry_app/models/services.dart';

import '../flutter_counter.dart';
import '../customobjects/customer.dart';
import '../customobjects/cloth.dart';

import 'package:http/http.dart' as http;

// class Washing extends StatefulWidget {
//   const Washing({
//     super.key,
//     this.operation,
//   });
//   final String? operation;
//   @override
//   WashingState createState() => WashingState();
// }

// class WashingState extends State<Washing> {
//   String response = "";
//   int total_sum = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.grey[600],
//                     size: 25,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.menu,
//                     color: Colors.grey[600],
//                     size: 25,
//                   ),
//                 )
//               ]),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(widget.operation.toString(),
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500)),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: CounterWidget(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// method for the search box
//   Container buildSearchContainer() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white70),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade200,
//               blurRadius: 3,
//               offset: const Offset(0, 3),
//             )
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         child: TextField(
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[500],
//           ),
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Search",
//             hintStyle: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//             fillColor: Colors.grey[500],
//             icon: const Icon(Icons.search),
//           ),
//           maxLines: 1,
//           textInputAction: TextInputAction.search,
//         ),
//       ),
//     );
//   }
// }

class Washing extends StatefulWidget {
  const Washing({super.key, this.operation});
  final String? operation;
  @override
  WashingState createState() => WashingState();
}

class WashingState extends State<Washing> {
  int selected = 0;
  int id = 0;
  List<int> quantities = [];
  Future getService() async {
    var url = Uri.http(Customer().server, '/laundry/services.php');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      print('status: ${response.statusCode}');
      // print('status: ${response.body}');
      List service;
      service = jsonDecode(response.body)
          .map((e) => ServiceModel.fromJson(e))
          .toList();
      print('services: ${service}');
      return service;
    } else {
      print('status: ${response.statusCode}');
      // print('status: ${response.body}');
      return response.body.toString();
    }
  }

  Future? getServices;

  @override
  void initState() {
    super.initState();
    getServices = getService();
  }

  @override
  Widget build(BuildContext context) {
    return buildContainerClothes();
  }

  Widget buildContainerClothes() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[600],
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey[600],
                    size: 25,
                  ),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(widget.operation.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder(
                    future: getService(),
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white70),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 3,
                                        offset: const Offset(0, 3),
                                      )
                                    ]),
                                child: Image.asset(
                                  snapshot.data[index].img,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].cloth,
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey[700]),
                                  ),
                                  Text(
                                    snapshot.data[index].price,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  ),
                                ],
                              ),
                              Counter(
                                minValue: 0,
                                maxValue: 100,
                                decimalPlaces: 0,
                                initialValue: selected,
                                step: 1,
                                color: Colors.white,
                                textStyle: const TextStyle(letterSpacing: 10),
                                onChanged: (value0) {
                                  setState(() {
                                    selected = value0.toInt();
                                    quantities[id] = value0.toInt();
                                  });
                                  double sum = 0;
                                  print(sum);
                                },
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                            padding: const EdgeInsets.all(40),
                            child: Center(
                                child: Text("Error: ${snapshot.error}")));
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(40),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.white, blurRadius: 1)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0XFF0E2433)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Next",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white70,
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'GHS ${id}',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
