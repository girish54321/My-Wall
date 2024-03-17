import 'package:flutter/material.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/widget/ImageRowSettingView.dart';

class DesktopMenu extends StatefulWidget {
  final List<Widget> screen;
  const DesktopMenu({
    Key? key,
    required this.screen,
  }) : super(key: key);

  @override
  State<DesktopMenu> createState() => _DesktopMenuState();
}

class _DesktopMenuState extends State<DesktopMenu> {
  int selectedIndex = 1;
  bool extended = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (p1) {
              setState(() {
                selectedIndex = p1;
              });
            },
            extended: extended,
            elevation: 1,
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    // const Expanded(child: ImageRowSettingView()),
                    const Expanded(child: Text("")),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: IconButton(
                          icon: !extended
                              ? const Icon(Icons.menu)
                              : const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              extended = !extended;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            // groupAlignment: 1,
            destinations: desktopBar),
        const VerticalDivider(thickness: 1, width: 2),
        Expanded(child: widget.screen[selectedIndex]),
      ],
    );
  }
}
