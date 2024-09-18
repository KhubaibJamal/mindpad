import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_initial_params.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_screen.dart';
import 'package:mind_pad/view/screens/home/home_cubit.dart';
import 'package:mind_pad/view/screens/home/home_initial_params.dart';
import 'package:mind_pad/view/screens/home/home_state.dart';
import 'package:mind_pad/view/screens/home/widget/note_tile.dart';
import 'package:mind_pad/view/utils/theme.dart';
import 'package:mind_pad/view/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  final HomeInitialParams initialParams;
  const HomeScreen({super.key, required this.initialParams});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<HomeCubit>(context)..getAllNote();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MindPad",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(
                initialParams: AddNoteInitialParams(isEditMode: false),
              ),
            ),
          ).then((value) {
            print("Navigated");
            cubit.getAllNote();
            print("Navigated COMPLETED");
          });
        },
        child: Center(
          child: Icon(
            Icons.add,
            color: CustomColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              state as HomeState;
              return Column(
                children: [
                  CustomTextField(
                    suffix: searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              // searchController.clear();
                              // context.read<NoteBloc>().add(LoadNotes());
                            },
                            icon: Icon(
                              Icons.close,
                              color: CustomColors.primary,
                            ),
                          )
                        : null,
                    prefix: Icon(
                      Icons.search,
                      color: CustomColors.primary,
                    ),
                    readOnly: false,
                    controller: searchController,
                    hintText: 'Search',
                    enabled: true,
                    onChanged: (query) {
                      //context.read<NoteBloc>().add(SearchNotes(query));
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                            itemCount: state.notes.length,
                            itemBuilder: (context, index) {
                              if (state.error!.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Card(
                                    child: NoteTile(
                                      note: state.notes[index],
                                      onEditPress: () {
                                        print("DDD: ${state.notes[index].id}");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddNoteScreen(
                                              // isEditMode: true,
                                              // note: state.notes[index],
                                              initialParams:
                                                  AddNoteInitialParams(
                                                isEditMode: true,
                                                note: state.notes[index],
                                              ),
                                            ),
                                          ),
                                        ).then((value) {
                                          print("Navigated");
                                          cubit.getAllNote();
                                          print("Navigated COMPLETED");
                                        });
                                      },
                                      onDeletePress: () {
                                        context
                                            .read<HomeCubit>()
                                            .deleteNote(state.notes[index].id);
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    state.error!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                ],
              );
            }),
      ),
    );
  }
}
