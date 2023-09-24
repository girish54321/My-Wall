import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/HomeTabGetx.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/widget/imageList.dart';

class ProfileScreen extends StatefulWidget {
  final UnsplashResponseUser? user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final HomeTabController homeController = Get.put(HomeTabController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                collapsedHeight: 430,
                expandedHeight: 370,
                title: Text(widget.user?.name ?? ''),
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70.0),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage(widget.user?.profileImage?.large ?? ""),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      widget.user?.name ?? '',
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.user?.bio ?? "",
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const SocialIcon(),
                  ],
                ),
                bottom: TabBar(
                  tabs: <Widget>[
                    ...mobileTabs,
                  ],
                ),
              )
            ];
          }),
          body: TabBarView(
            children: <Widget>[
              ImageList(
                imageList: homeController.homeScreenImage,
                isLoading: homeController.homeScreenLoading.value,
                scrollController: null,
              ),
              ImageList(
                imageList: homeController.homeScreenImage,
                isLoading: homeController.homeScreenLoading.value,
                scrollController: null,
              ),
              ImageList(
                imageList: homeController.homeScreenImage,
                isLoading: homeController.homeScreenLoading.value,
                scrollController: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.car_crash)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.paypal)),
          ],
        ),
      ),
    );
  }
}
