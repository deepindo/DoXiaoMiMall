import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/keepAliveWrapper.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("111111"),
            ),
            ListTile(
              title: Text("144441"),
            ),
          ],
        )));
  }
}
