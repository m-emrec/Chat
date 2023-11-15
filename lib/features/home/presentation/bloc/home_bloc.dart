import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(onHomeEvent);
    on<HomeChatViewEvent>(onHomeChatViewEvent);
    on<HomeContactsViewEvent>(onHomeContactsViewEvent);
    on<HomeProfileViewEvent>(onHomeProfileViewEvent);
    on<HomeProfileViewEditEvent>(onHomeProfileViewEditEvent);
  }

  FutureOr<void> onHomeEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    await initializeDependenciesAfterAuth();

    final User? _user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(_user!.uid)
            .get();
    final Map<String, dynamic> _data = snapshot.data()!;

    sl.registerSingleton<UserModel>(
      UserModel(
        email: _data["email"],
        name: _data["name"],
        phoneNumber: _data["phone"],
      ),
    );
    emit(HomeChatViewStae());
  }

  FutureOr<void> onHomeChatViewEvent(
      HomeChatViewEvent event, Emitter<HomeState> emit) {
    emit(HomeChatViewStae());
  }

  FutureOr<void> onHomeProfileViewEvent(
      HomeProfileViewEvent event, Emitter<HomeState> emit) {
    emit(HomeProfileViewStae());
  }

  FutureOr<void> onHomeContactsViewEvent(
      HomeContactsViewEvent event, Emitter<HomeState> emit) {
    emit(HomeContactsViewStae());
  }

  FutureOr<void> onHomeProfileViewEditEvent(
      HomeProfileViewEditEvent event, Emitter<HomeState> emit) {
    emit(HomeProfileViewEditState());
  }
}
