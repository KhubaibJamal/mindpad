import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_pad/data/note_services.dart';
import 'package:mind_pad/domain/repository/note_repository.dart';
import 'package:mind_pad/firebase_options.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_cubit.dart';
import 'package:mind_pad/view/screens/home/home_initial_params.dart';
import 'package:mind_pad/view/screens/home/home_screen.dart';
import 'package:mind_pad/view/screens/home/home_cubit.dart';
import 'package:mind_pad/view/utils/theme.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<NoteRepository>(NoteService());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(getIt())),
        BlocProvider(create: (context) => AddNoteCubit(getIt())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindPad',
      theme: lightTheme,
      home: const HomeScreen(initialParams: HomeInitialParams()),
    );
  }
}
