import 'package:flutter/material.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/navbar_home.svg",
            color: AppColors.iconColor2,
            width: 20,
          ),
          label: 'Home',
          activeIcon: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainColor2,
            ),
            child: SvgPicture.asset(
              "assets/icons/navbar_home.svg",
              color: AppColors.iconColor1,
              width: 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/navbar_doc.svg",
            color: AppColors.iconColor2,
            width: 20,
          ),
          label: 'Document',
          activeIcon: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainColor2,
            ),
            child: SvgPicture.asset(
              "assets/icons/navbar_doc.svg",
              color: AppColors.iconColor1,
              width: 20,
            ),
          )
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/navbar_sale.svg",
            color: AppColors.iconColor2,
            width: 24,
          ),
          label: 'Sale',
          activeIcon: Container(
            padding: EdgeInsets.all(9),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainColor2,
            ),
            child: SvgPicture.asset(
              "assets/icons/navbar_sale.svg",
              color: AppColors.iconColor1,
              width: 24,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/navbar_account.svg",
            color: AppColors.iconColor2,
            width: 20,
          ),
          label: 'Account',
          activeIcon: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainColor2,
            ),
            child: SvgPicture.asset(
              "assets/icons/navbar_account.svg",
              color: AppColors.iconColor1,
              width: 20,
            ),
          )
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}



// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 12,
//       ),
//       height: 60,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 2),
//             blurRadius: 12,
//             color: Color.fromRGBO(103, 115, 133, 0.2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           IconButton(
//             icon: SvgPicture.asset("assets/icons/navbar_home.svg"),
//             color: Colors.black,
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: SvgPicture.asset("assets/icons/navbar_doc.svg"),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: SvgPicture.asset("assets/icons/navbar_sale.svg"),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: SvgPicture.asset("assets/icons/navbar_account.svg"),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }