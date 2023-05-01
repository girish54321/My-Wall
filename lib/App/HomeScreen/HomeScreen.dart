import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/HomeScreenGetx.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenUI.dart';
import 'package:reqres_app/App/SettingsScreen/SettingsScreen.dart';
import 'package:reqres_app/App/UserInfoScreen/userinfoScreenUI.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/state/userListState.dart';
import 'package:reqres_app/widget/DialogHelper.dart';
import 'package:reqres_app/widget/appAboutDialog.dart';
import 'package:reqres_app/widget/appNetWorkImage%20copy.dart';
import 'package:reqres_app/widget/buttons.dart';

class AppMenuItem {
  final String id;
  final Widget widget;
  AppMenuItem(this.id, this.widget);
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  int selectedIndex = 0;
  final List<Widget> _children = [
    SettingsScreen(),
    SettingsScreen(),
    SettingsScreen(),
  ];
  final ProductController controller = Get.put(ProductController());
  final HomeScreenController homeController = Get.put(HomeScreenController());
  final List<AppMenuItem> menu = [
    AppMenuItem(
        "setting",
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        )),
    AppMenuItem(
        "logout",
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
        ))
  ];

  Future<void> userLogout() async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      // Get.offAll(LoginScreen());
    }
  }

  void goToUserInfoScreen(UserListResponseData userListResponseData) {
    controller.selectUser(userListResponseData);
    Helper().goToPage(context: context, child: const UserInfoScreen());
  }

  void goToSettings() {
    Helper().goToPage(context: context, child: SettingsScreen());
  }

  @override
  void initState() {
    super.initState();
  }

  Widget mainView() {
    return Obx(
      (() => homeController.homeScreenLoading.value
          ? const Center(child: CircularProgressIndicator())
          : homeController.homeScreenImage.value.isEmpty
              ? const Text("Noting Here")
              : MasonryGridView.builder(
                  crossAxisSpacing: 6.5,
                  mainAxisSpacing: 6.5,
                  padding: const EdgeInsets.all(
                    6.5,
                  ),
                  itemCount: homeController.homeScreenImage.value.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    UnsplashResponse item =
                        homeController.homeScreenImage.value[index];
                    return AppNetWorkImage(
                      blurHash: item.blurHash ?? "",
                      height: item.height ?? 10,
                      imageUrl: item.urls?.small ?? "",
                      width: item.width ?? 11,
                    );
                  })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenUI(
      children: [mainView(), mainView(), mainView()],
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Home"),
    //   ),
    //   // body: ,
    //   body: ,
    // );
  }
}
