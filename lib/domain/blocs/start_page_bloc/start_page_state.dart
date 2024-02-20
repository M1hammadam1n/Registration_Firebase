part of 'start_page_bloc.dart';

@immutable
sealed class StartPageState {}

final class StartPageInitial extends StartPageState {}

final class StartPageLoadedState extends StartPageState {
  final List<String> images = [
    AppImages.pizza,
    AppImages.donut,
    AppImages.burger,
  ];
  
  final List<String> text =[
    "I don't feel link cooking. Let's order food delivery.",
    "Donut worry, be happy and eat more donuts!",
    "Good music and good food makes me happy.",
  ];
}