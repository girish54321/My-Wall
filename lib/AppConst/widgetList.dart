import 'package:flutter/material.dart';

List<Widget> mobileTabs = [
  Tab(
    text: "Home".toUpperCase(),
  ),
  Tab(
    text: "Trending".toUpperCase(),
  ),
  Tab(
    text: "Category".toUpperCase(),
  ),
  Tab(
    text: "Gratings".toUpperCase(),
  ),
  // Tab(
  //   text: "Saved".toUpperCase(),
  // ),
  // Tab(
  //   text: "Like".toUpperCase(),
  // ),
];

List<NavigationRailDestination> desktopBar = [
  const NavigationRailDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: Text("Home"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.whatshot_outlined),
    selectedIcon: Icon(Icons.whatshot),
    label: Text('Trending'),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.book_outlined),
    selectedIcon: Icon(Icons.book),
    label: Text('Category'),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.g_mobiledata_outlined),
    selectedIcon: Icon(Icons.g_mobiledata),
    label: Text('Gratings'),
  ),
];

// List<DesktopDrawer> desktopTabs = [
//   new DesktopDrawer(
//     "Home",
//     Icons.home,
//   ),
//   new DesktopDrawer(
//     "Trending",
//     Icons.whatshot,
//   ),
//   new DesktopDrawer(
//     "Category",
//     Icons.book,
//   ),
//   new DesktopDrawer(
//     "Like",
//     Icons.thumb_up,
//   ),
//   new DesktopDrawer(
//     "About",
//     Icons.info_outline,
//   )
// ];
