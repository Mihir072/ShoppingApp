import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(20),
      ),
//       backgroundColor: MyTheme.creamColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: 'Cart'.text.bold.make(),
//       ),
    );
  }
}
