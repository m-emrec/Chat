import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:chat_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final HomeBloc homeBloc;
  const Navbar({super.key, required this.homeBloc});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late HomeBloc _homeBloc;
  late int _navIndex;
  @override
  void initState() {
    _homeBloc = widget.homeBloc;
    _navIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        ///
        ///* Border
        border: Border(
          top: BorderSide(
            color: AppColors.button,
          ),
        ),

        //* Shadow
        boxShadow: [
          BoxShadow(
            color: Color(0x3F153243),
            blurRadius: 8,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.scaffold,
        currentIndex: _navIndex,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black,
        onTap: (navIndex) {
          switch (navIndex) {
            //* Chat View
            case 0:
              _homeBloc.add(HomeChatViewEvent());
              setState(() {
                _navIndex = 0;
              });
              break;
            //* Contacts View
            case 1:
              _homeBloc.add(HomeContactsViewEvent());
              setState(() {
                _navIndex = 1;
              });

              break;
            // * Profile View
            case 2:
              setState(() {
                _navIndex = 2;
              });
              _homeBloc.add(HomeProfileViewEvent());

              break;

            default:
          }
        },
        items: [
          //* Chat
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("chat".icon.toPng),
              size: 32,
            ),
            label: "Chat",
          ),

          //* Contacts
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("contacts".icon.toPng),
              size: 32,
            ),
            label: "Contacts",
          ),

          //* Profile
          BottomNavigationBarItem(
            label: "Profile",
            icon: CircleAvatar(
              radius: 16,
              child: Center(
                child: Text(
                  FirebaseAuth.instance.currentUser!.displayName?[0] ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.scaffold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
