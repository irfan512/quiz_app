import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .6,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: QuillToolbar.basic(
            controller: _controller,
            toolbarIconAlignment: WrapAlignment.start,
            showFontFamily: false,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .6,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(width: 1, color: Colors.black),
              right: BorderSide(width: 1, color: Colors.black),
              bottom: BorderSide(width: 1, color: Colors.black),
            ),
          ),
          child: QuillEditor.basic(
            controller: _controller,
            readOnly: false, // true for view only mode
          ),
        ),
      ],
    );
  }
}
