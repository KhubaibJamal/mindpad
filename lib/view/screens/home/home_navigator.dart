import 'package:flutter/widgets.dart';
import 'package:mind_pad/navigation/app_navigation.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_navigator.dart';
import 'package:mind_pad/view/screens/home/home_initial_params.dart';
import 'package:mind_pad/view/screens/home/home_screen.dart';

class HomeNavigator with AddNoteRoute {
  HomeNavigator(this.appNavigation);

  @override
  final AppNavigation appNavigation;

  @override
  late BuildContext context;
}

mixin HomeRoute {
  pushToHome(HomeInitialParams initialParams) {
    appNavigation.push(context, HomeScreen(initialParams: initialParams));
  }

  AppNavigation get appNavigation;

  BuildContext get context;
}
