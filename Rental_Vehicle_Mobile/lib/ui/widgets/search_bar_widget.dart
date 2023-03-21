import 'dart:async';

import 'package:flutter/material.dart';

import '/res/style.dart';
import '../../res/theme/theme_service.dart';

class SearchBarWidget extends StatefulWidget {
  final String? hint;
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final TextStyle? textStyle;
  final Widget? searchIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  SearchBarWidget(
      {this.hint, this.onTextChanged, this.autoFocus = false, this.textStyle, this.searchIcon, this.controller, this.textInputAction, this.onFieldSubmitted});

  @override
  State<StatefulWidget> createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _searchQuery;
  Timer? _debounce;

  _onSearchChanged() {
    setState(() {
      if (_debounce?.isActive == true) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (widget.onTextChanged != null) {
          widget.onTextChanged!(_searchQuery.text);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.controller ?? TextEditingController();
    _searchQuery.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      color: getColor().themeColorF5F6F8,
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        autofocus: widget.autoFocus,
        controller: _searchQuery,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.ws, horizontal: 0.0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.hint ?? "",
          hintStyle: widget.textStyle?.copyWith(color: getColor().themeColorB2B2B2),
          prefixIconConstraints: const BoxConstraints(maxHeight: 24, minHeight: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: widget.searchIcon ?? Assets.images.imgSearchGray.image(width: 16.ws, height: 16.ws),
          ),
          suffixIconConstraints: const BoxConstraints(maxWidth: 30, maxHeight: 24, minHeight: 24),
          suffixIcon: _searchQuery.text != ""
              ? Padding(
                  padding: EdgeInsets.only(right: 10.ws),
                  child: MaterialButton(
                    height: 24.ws,
                    minWidth: 24.ws,
                    padding: const EdgeInsets.all(0),
                    onPressed: () => _searchQuery.clear(),
                    shape: const CircleBorder(),
                    child: Assets.images.imgTextClear.image(width: 16.ws, height: 16.ws),
                  ),
                )
              : null,
          isDense: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
