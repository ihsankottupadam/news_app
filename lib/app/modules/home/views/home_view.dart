import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/services/auth_servcice.dart';
import 'package:news_app/app/modules/home/views/search_delegate.dart';

import '../../../widgets/dialog_confirm.dart';
import '../../../widgets/news_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f4f4),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'NEWS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: 'Roboto'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchView());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ConfirmDialog(
                        title: 'Confirm',
                        text: 'Are you sure you wants to logout?',
                        conformText: 'Logout',
                        onConfirm: AuthService.signOut,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.categories
                .map((e) => Tab(
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.isLoaading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: controller.newsList.length,
              itemBuilder: (context, index) {
                return NewsTile(news: controller.newsList[index]);
              },
            );
          },
        ));
  }
}
