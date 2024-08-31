import 'package:flutter/material.dart';

import 'mainTextWidget.dart';

class DocumentsListTile extends StatelessWidget {
   DocumentsListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.function,
    this.fileType,
  });

  final String title;
  final String subTitle;
   String? fileType = '.pdf';
  final Function function;

  @override
  Widget build(BuildContext context) {
    String newTitle = title;
    String newSubTitle = subTitle;

    if (subTitle.length > 30) {
      newSubTitle = subTitle.replaceRange(31, subTitle.length, '...');
    }
    if (title.length > 20) {
      newTitle = title.replaceRange(21, title.length, '...');
    }
    return ListTile(
      onTap: () {},
      leading: fileType!.contains('pdf')? const Icon(Icons.picture_as_pdf): const Icon(Icons.file_copy),
      title: NormalTexts(text: newTitle),
      subtitle: SmallTexts(
        text: newSubTitle,
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        child: const Icon(Icons.download),
      ),
    );
  }
}
