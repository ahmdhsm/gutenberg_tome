import 'package:flutter/material.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';
import 'package:gutenberg_tome/l10n/l10n.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _clearValue() {
    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColor.buttonText,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _textController,
              style: TextStyle(
                color: AppColor.buttonText,
                fontSize: 20,
              ),
              cursorColor: AppColor.buttonText,
              decoration: InputDecoration(
                hintText: context.l10n.searchBook,
                hintStyle: TextStyle(
                  color: AppColor.secondaryText,
                  fontSize: 20,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (_textController.text != '')
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: _clearValue,
              child: Icon(
                Icons.close,
                color: AppColor.buttonText,
              ),
            ),
        ],
      ),
    );
  }
}
