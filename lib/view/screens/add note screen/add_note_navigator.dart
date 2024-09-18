import 'package:flutter/src/widgets/framework.dart';
import 'package:mind_pad/navigation/app_navigation.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_initial_params.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_screen.dart';

class AddNoteNavigator {}

mixin AddNoteRoute {
  pushToHome(AddNoteInitialParams initialParams) {
    appNavigation.push(context, AddNoteScreen(initialParams: initialParams));
  }

  AppNavigation get appNavigation;

  BuildContext get context;
}
