import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_app/features/home/presentation/widgets/nav_bar.dart';
import 'package:chat_app/features/contacts/presentation/pages/contacts_page.dart';
import 'package:chat_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();
  @override
  void initState() {
    _homeBloc.add(HomeChatViewEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          // * Chat View
          case HomeChatViewStae:
            return Scaffold(
              bottomNavigationBar: Navbar(
                homeBloc: _homeBloc,
              ),
              body: const ChatPage(),
            );
          //* Contacts View
          case HomeContactsViewStae:
            return Scaffold(
              backgroundColor: AppColors.scaffold,
              bottomNavigationBar: Navbar(
                homeBloc: _homeBloc,
              ),
              body: const ContactsPage(),
            );
          // *Profile View
          case HomeProfileViewStae:
            return Scaffold(
              backgroundColor: AppColors.scaffold,
              bottomNavigationBar: Navbar(
                homeBloc: _homeBloc,
              ),
              body: const ProfilePage(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
