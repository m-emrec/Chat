import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeChatViewEvent>(onHomeChatViewEvent);
    on<HomeContactsViewEvent>(onHomeContactsViewEvent);
    on<HomeProfileViewEvent>(onHomeProfileViewEvent);
    on<HomeProfileViewEditEvent>(onHomeProfileViewEditEvent);
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
