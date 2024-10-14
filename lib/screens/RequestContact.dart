import 'package:flutter/material.dart';

class RequestContact extends StatefulWidget {
  const RequestContact({super.key});

  @override
  State<RequestContact> createState() => _RequestContactState();
}

class _RequestContactState extends State<RequestContact> {
  // late final EasyAppController controller = EasyAppController(
  //   intialBody: EasyBody(child: tile1.body, title: tile1.title),
  // );

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
      // EasyDashboard(
      //   controller: controller,
      //   navigationIcon: const Icon(Icons.menu, color: Colors.white),
      //   appBarActions: actions,
      //   centerTitle: true,
      //   appBarColor: Colors.teal,
      //   sideBarColor: Colors.grey.shade100,
      //   tabletView: const TabletView(
      //     fullAppBar: true,
      //     border: BorderSide(width: 0.5, color: Colors.grey),
      //   ),
      //   desktopView: const DesktopView(
      //     fullAppBar: true,
      //     border: BorderSide(width: 0.5, color: Colors.grey),
      //   ),
      //   drawer: (Size size, Widget? child) {
      //     return EasyDrawer(
      //       iconColor: Colors.teal,
      //       hoverColor: Colors.grey.shade300,
      //       tileColor: Colors.grey.shade100,
      //       selectedColor: Colors.black.withGreen(80),
      //       selectedIconColor: Colors.white,
      //       textColor: Colors.black.withGreen(20),
      //       selectedTileColor: Colors.teal.shade400.withOpacity(.8),
      //       tiles: tiles,
      //       topWidget: SideBox(
      //         scrollable: true,
      //         height: 150,
      //         child: topOpenWidget,
      //       ),
      //       bottomWidget: SideBox(
      //         scrollable: false,
      //         height: 50,
      //         child: bottomOpenWidget,
      //       ),
      //       bottomSmallWidget: SideBox(
      //         height: 50,
      //         child: bottomSmallWidget,
      //       ),
      //       topSmallWidget: SideBox(
      //         height: 50,
      //         child: topSmallWidget,
      //       ),
      //       size: size,
      //       onTileTapped: (body) {
      //         controller.switchBody(body);
      //       },
      //     );
      //   },
      // );
  }
}
