//
// import 'package:ebasket/controller/splash_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class SplashScreen22 extends StatefulWidget {
//   @override
//   State<SplashScreen22> createState() => _SplashScreen22State();
// }
//
// class _SplashScreen22State extends State<SplashScreen22> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GetBuilder(
//       dispose: (_) {
//         print("Dispose spalash");
//       },
//       builder: (_) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 child: Center(
//                   child: Image.network(
//                     "https://grocery.ebasket.com.bd/_next/image?url=https%3A%2F%2Fgrocery.ebasket.com.bd%2Fapi%2Fstorage%2F2545%2FeBasket-Grocery-Logo_Revarsed_Color-185X58.png&w=1920&q=75",
//                     height: 200,
//                     width: 150,
//                     fit: BoxFit.cover,
//                     // width: size.width,
//                   ),
//                 ),
//               ),
//
//
//               // Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: CircularProgressIndicator(
//               //     color: Colors.amber,
//               //   ),
//               // )
//             ],
//           ),
//         );
//       },
//       init: SpalashController(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';



class SplashScreen22 extends StatefulWidget {
  const SplashScreen22({Key? key}) : super(key: key);

  @override
  State<SplashScreen22> createState() => _SplashScreen22State();
}


class _SplashScreen22State extends State<SplashScreen22> {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return GetBuilder(
      dispose: (_) {
        print("Dispose spalash");
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    // / height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // width: size.width,
                  ),
                ),
              ),



              //   Text("Dr. Shah Alam",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
            ],
          ),
        );
      },
      init: SpalashController(),
    );
  }
}
