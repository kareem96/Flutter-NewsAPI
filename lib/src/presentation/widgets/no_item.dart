import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controller/search_controller.dart';

class NoItemView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 30,
                      width: 300,
                      child: TextFormField(
                        style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 175,
              ),
              Column(
                children: [
                  Image.asset('assets/search.png', color: Colors.black12),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Item Not Found",
                    style:
                    TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight
                        .bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Try searching the item with",
                      style: TextStyle(fontSize: 18, color: Colors.black26)),
                  const Text("a different keyword.",
                      style: TextStyle(fontSize: 18, color: Colors.black26)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}