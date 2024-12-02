import 'package:flutter/material.dart';

void showNoteDialog({
  required BuildContext context,
  String text = '',
  required ValueChanged<String> onSaved,
}) {
  showDialog(
    context: context,
    builder: (context) => NoteDialog(
      text: text,
      onSaved: onSaved,
    ),
  );
}

class NoteDialog extends StatefulWidget {
  const NoteDialog({
    super.key,
    required this.text,
    required this.onSaved,
  });

  final String text;
  final ValueChanged<String> onSaved;

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your note here...',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onSaved(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
