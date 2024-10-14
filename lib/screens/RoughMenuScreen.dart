import 'package:buy_sell/screens/BuyRentFlat.dart';
import 'package:buy_sell/screens/BuyRentFlatProfile.dart';
import 'package:buy_sell/screens/BuyRentGallery.dart';
import 'package:buy_sell/screens/BuyRentOwner.dart';
import 'package:flutter/material.dart';


class RoughMenuBar extends StatefulWidget {
  const RoughMenuBar({super.key});

  @override
  State<RoughMenuBar> createState() => _RoughMenuBarState();
}

class _RoughMenuBarState extends State<RoughMenuBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BuyRentFlat(),
    const BuyRentFlatProfile(),
    const BuyRentGallery(),
    const BuyRentOwner()
  ];

  @override
  Widget build(BuildContext context) {
    return
        //   DefaultTabController(
        //   length: _screens.length,
        //   child: Scaffold(
        //     appBar: AppBar(
        //       // leading: const Icon(Icons.menu,color: Colors.white),
        //       leading: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: GestureDetector(
        //       onTap: () => print('TAPPED!'),
        //       child: const Icon(Icons.menu),
        //       ),
        //       ),
        //     ),
        //     body: TabBarView(
        //       children: _screens,
        //     ),
        //   ),
        // );
        DefaultTabController(
          length: _screens.length,
          child: Scaffold(
            appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'Dashboard',
              ),
              Tab(icon: Icon(Icons.list), text: 'Property Details'),
              Tab(icon: Icon(Icons.image), text: 'Property Gallery'),
              Tab(icon: Icon(Icons.post_add), text: 'Post Advertisement'),
            ],
          ),
        ),
        body: TabBarView(
          children: _screens,
        ),
      ),
    );
  }
}
