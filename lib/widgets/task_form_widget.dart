import 'package:flutter/material.dart';

class TaskFormWidget extends StatelessWidget {
  final String? title;
  final String? detail;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDetail;
  final VoidCallback onSave;

  const TaskFormWidget(
      {Key? key,
      this.title,
      this.detail,
      required this.onChangedTitle,
      required this.onChangedDetail,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleTextField(),
          const SizedBox(
            height: 8,
          ),
          descriptionTextField(),
          const SizedBox(
            height: 20,
          ),
          buttonSave()
        ],
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      key: const Key('addTitleField'),
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) => TitleFieldValidator.validate(title!),
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Title'),
    );
  }

  Widget descriptionTextField() {
    return TextFormField(
      maxLines: 2,
      initialValue: detail,
      onChanged: onChangedDetail,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Detail'),
    );
  }

  Widget buttonSave() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            key: const Key('addButton'),
            onPressed: onSave,
            child: const Text('Save')));
  }
}

// for unit test
class TitleFieldValidator {
  static String? validate(String title) {
    if (title.isEmpty) {
      return 'Title cannot be empty';
    } else if (title.length < 3) {
      return 'Title must have more 3 character';
    }
    return null;
  }
}
