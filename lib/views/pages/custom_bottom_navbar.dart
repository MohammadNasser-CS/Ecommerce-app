import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/cart_page_cubit/cart_cubit.dart';
import 'package:e_commerce/controllers/favorite_page_cubit/favorite_cubit.dart';
import 'package:e_commerce/views/pages/cart_page/cart_page.dart';
import 'package:e_commerce/views/pages/favorite_page/favorite_page.dart';
import 'package:e_commerce/views/pages/Home_page/home_page.dart';
import 'package:e_commerce/views/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      BlocProvider(
        create: (context) {
          final cubit = CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: const CartPage(),
      ),
      BlocProvider(
        create: (context) {
          final cubit = FavoriteCubit();
          cubit.getFavoriteData();
          return cubit;
        },
        child: const FavoritePage(),
      ),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: "Favorite",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "MyProfile",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/myphotocopy.jpg'),
          ),
        ),
        title: _controller.index == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Mohammad',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Let\'s start shopping!',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                        ),
                  )
                ],
              )
            : _controller.index == 1
                ? const Center(child: Text('My Cart'))
                : _controller.index == 2
                    ? const Center(child: Text('My Favoritre'))
                    : null,
        actions: [
          if (_controller.index == 0) ...[
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                  AppRoutes.search,
                );
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          if (_controller.index == 1)
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ordersPage);
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text('My Orders'),
            ),
          if (_controller.index == 2)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_on),
            ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
        onItemSelected: (value) => setState(() {
          _controller.index = value;
        }),
        stateManagement: false,
      ),
    );
  }
}
