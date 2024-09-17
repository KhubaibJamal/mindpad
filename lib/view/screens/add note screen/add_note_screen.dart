import 'package:flutter/material.dart';
import 'package:mind_pad/view/utils/theme.dart';
import 'package:mind_pad/view/widgets/custom_button.dart';
import 'package:mind_pad/view/widgets/custom_textfield.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  bool loading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }

  // initialization() {
  //   if (widget.isEditMode && widget.noteModel != null) {
  //     titleController.text = widget.noteModel!.title!;
  //     descriptionController.text = widget.noteModel!.description!;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
         // widget.isEditMode ? "Edit Note" : "Add a Note",
         "Add a note",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.015),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Title",
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            CustomTextField(
              enabled: true,
              type: TextInputType.name,
              controller: titleController,
              hintText: "Enter Title Here",
              readOnly: false,
            ),
            SizedBox(height: height * 0.01),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Description"),
              ],
            ),
            SizedBox(height: height * 0.01),
            CustomTextField(
              enabled: true,
              type: TextInputType.name,
              controller: descriptionController,
              hintText: "Enter Description Here",
              readOnly: false,
              maxLines: 3,
            ),
            SizedBox(height: height * 0.02),
            loading
                ? Center(
                    child: CircularProgressIndicator(color: CustomColors.white),
                  )
                : CustomButton(
                    height: 50,
                   // title: widget.isEditMode ? 'Update' : 'Add',
                   title: 'Add',
                    onTap: () {
                      setState(() {
                        loading = true;
                      });
                      // if (widget.isEditMode) {
                      //   // update function
                      //   noteContext.read<NoteBloc>().add(UpdateNote(
                      //         NoteModel(
                      //             id: widget.noteModel!.id,
                      //             title: titleController.text,
                      //             description: descriptionController.text),
                      //       ));
                      // } else {
                      //   // add function
                      //   noteContext.read<NoteBloc>().add(
                      //         AddNote(
                      //           NoteModel(
                      //             id: '',
                      //             title: titleController.text,
                      //             description: descriptionController.text,
                      //           ),
                      //         ),
                      //       );
                      // }
                      // setState(() {
                      //   loading = false;
                      // });
                      // Navigator.of(context).pop();
                    },
                    loading: loading,
                  ),
          ],
        ),
      ),
    );
  }
}
