import 'package:e_commerce_app/ui/home/search/search_view_model.dart';
import 'package:e_commerce_app/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetWidget<SearchViewModel> {
  SearchScreen({Key? key}) : super(key: key);
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              InputWidget(
                prefixIcon: const Icon(Icons.search),
                hint: "Search Text",
                onSaved: (value) {
                  controller.updateSearchText(value ?? "");
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: ListTile(
                              title: Text(controller.history.elementAt(index)),
                              trailing: const Icon(Icons.history),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.history.length,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: ListTile(
                              title: Text(controller.history.elementAt(index)),
                              trailing: const Icon(Icons.history),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.history.length,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
