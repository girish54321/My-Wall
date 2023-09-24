// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';
// import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/HomeTabGetx.dart';
// import 'package:reqres_app/App/ImageView/imageView.dart';
// import 'package:reqres_app/network/model/UnPlashResponse.dart';
// import 'package:reqres_app/network/util/helper.dart';
// import 'package:reqres_app/widget/appNetWorkImage%20copy.dart';

// class ProfileScreen extends StatefulWidget {
//   final UnsplashResponseUser? user;

//   const ProfileScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen>
//     with SingleTickerProviderStateMixin {
//   final HomeTabController homeController = Get.put(HomeTabController());
//   late TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 1, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
// SliverAppBar(
//   collapsedHeight: 440,
//   expandedHeight: 370,
//   title: const Text('Collapsible App Bar Example'),
//   floating: false,
//   flexibleSpace: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const SizedBox(height: 70.0),
//       CircleAvatar(
//         radius: 50.0,
//         backgroundImage:
//             NetworkImage(widget.user?.profileImage?.large ?? ""),
//       ),
//       const SizedBox(height: 20.0),
//       Text(
//         widget.user?.name ?? '',
//         style: const TextStyle(
//             fontSize: 24.0, fontWeight: FontWeight.bold),
//       ),
//       const SizedBox(height: 20.0),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Text(
//           widget.user?.bio ?? "",
//           style: const TextStyle(fontSize: 14.0),
//         ),
//       ),
//       const SizedBox(height: 20.0),
//       const SocialIcon(),
//     ],
//   ),
// ),
// SliverPadding(
//   padding:
//       const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
//   sliver: SliverMasonryGrid.count(
//     crossAxisCount: 2,
//     mainAxisSpacing: 8,
//     crossAxisSpacing: 8,
//     childCount: homeController.homeScreenImage.length,
//     itemBuilder: (context, index) {
//       UnsplashResponse? item = homeController.homeScreenImage[index];
//       return InkWell(
//         onTap: () {
//           Helper().goToPage(
//               context: context,
//               child: ImageView(unPlashResponse: item));
//         },
//         child: AppNetWorkImage(
//           blurHash: item?.blurHash ?? "",
//           height: item?.height ?? 10,
//           imageUrl: item?.urls?.small ?? "",
//           width: item?.width ?? 11,
//         ),
//       );
//     },
//   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // String? instagramUsername;
// // String? portfolioUrl;
// // String? twitterUsername;
// // String? paypalEmail;

// class ImageListItem extends StatelessWidget {
//   final String imageUrl;

//   ImageListItem({required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       // child: Image.asset(imageUrl),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/HomeTabGetx.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/widget/appNetWorkImage%20copy.dart';

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
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  collapsedHeight: 430,
                  expandedHeight: 370,
                  title: Text(widget.user?.name ?? ''),
                  floating: false,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70.0),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            widget.user?.profileImage?.large ?? ""),
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
                ),
                SliverPersistentHeader(
                  floating: false,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      tabs: [
                        Tab(text: 'All Phots'.toUpperCase(), height: 60),
                        Tab(text: 'Collection'.toUpperCase(), height: 60),
                        Tab(text: 'Likes'.toUpperCase(), height: 60),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                _buildSliverList('Tab 1 Content'),
                _buildSliverList('Tab 2 Content'),
                _buildSliverList('Tab 3 Content'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverList(String content) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          sliver: SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childCount: homeController.homeScreenImage.length,
            itemBuilder: (context, index) {
              UnsplashResponse? item = homeController.homeScreenImage[index];
              return InkWell(
                onTap: () {
                  // Helper().goToPage(
                  //     context: context,
                  //     child: ImageView(unPlashResponse: item));
                },
                child: AppNetWorkImage(
                  blurHash: item.blurHash ?? "",
                  height: item.height ?? 10,
                  imageUrl: item.urls?.small ?? "",
                  width: item.width ?? 11,
                ),
              );
            },
          ),
        )
      ],
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
