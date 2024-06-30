import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onSearch,
    required this.placeholder,
  });

  final Future<void> Function(String) onSearch;
  final String placeholder;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounceTimer;
  final _debounceDuration = const Duration(milliseconds: 500);
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _clearValue() {
    _textController.text = '';
    setState(() {});
    widget.onSearch('');
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
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: AppColor.secondaryText,
                  fontSize: 20,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {});

                if (_debounceTimer != null && _debounceTimer!.isActive) {
                  _debounceTimer!.cancel();
                }

                _debounceTimer = Timer(_debounceDuration, () {
                  widget.onSearch(value);
                });
              },
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
