import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/contacts/presentation/pages/contacts_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

class Navbar extends StatefulWidget {
  final int navIndex;
  const Navbar({super.key, required this.navIndex});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.scaffold,
        currentIndex: widget.navIndex,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black,
        onTap: (navIndex) {
          switch (navIndex) {
            /// TODO: Add block to control pages
            case 0:
              // logger.i("Chat");
              Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              break;
            case 1:
              Navigator.of(context)
                  .pushReplacementNamed(ContactsPage.routeName);

              // logger.i("Contacts");
              break;
            case 2:
              // logger.i("Profile");

              Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);

              break;

            default:
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("chat".icon.toPng),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("contacts".icon.toPng),
            ),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SizedBox(
              height: 36,
              width: 36,
              child: Card(
                elevation: 3,
                color: AppColors.button,
                shape: const CircleBorder(),
                // radius: 16,
                child: Center(
                  child: Text(
                    FirebaseAuth.instance.currentUser!.displayName![0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.scaffold,
                    ),
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
