
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../categories_screen/categorie_screen.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home/home_page/home_page.dart';
import '../my_bag/my_bag_pages/my_bag_page.dart';
import '../myprofile_screen/my_profile_screen.dart';

class PersistentNavigationBar extends StatefulWidget {
  PersistentNavigationBar({super.key});

  @override
  State<PersistentNavigationBar> createState() => _PersistentNavigationBarState();
}

class _PersistentNavigationBarState extends State<PersistentNavigationBar> {
  int selectedIndex = -1;

  int _currentIndex = 0;

  List navBarItemList = [
    [AppIcons.homeIconOutline, "Home"],
    [AppIcons.shopIconOutline, "Shop"],
    [AppIcons.bagIconOutline, "Bag"],
    [AppIcons.favoriteIconOutline, "Favorites"],
    [AppIcons.profileIconOutline, "Profile"],
  ];

  List<PersistentBottomNavBarItem> itemsList =[];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: _currentIndex),
      screens: [
        HomePage(),
        CategoriesScreen(),
        MyBagPage(),
        FavoriteScreen(),
        MyProfile()
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            activeColorPrimary: AppColors.buttonsColor,
            inactiveColorPrimary: AppColors.grayColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_cart),
            title: "Shop",
            activeColorPrimary: AppColors.buttonsColor,
            inactiveColorPrimary: AppColors.grayColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_bag),
            title: "Bag",
            activeColorPrimary: AppColors.buttonsColor,
            inactiveColorPrimary: AppColors.grayColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.favorite_sharp),
            title: "Favorites",
            activeColorPrimary: AppColors.buttonsColor,
            inactiveColorPrimary: AppColors.grayColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            title: "Profile",
            activeColorPrimary: AppColors.buttonsColor,
            inactiveColorPrimary: AppColors.grayColor),
      ],
      confineInSafeArea: true,
      backgroundColor: AppColors.whiteColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (index){
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}