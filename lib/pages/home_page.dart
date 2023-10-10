import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catolog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/Catalog_header.dart';
import '../widgets/home_widgets/Catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Shopping_App";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                // ignore: unnecessary_null_comparison
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}
