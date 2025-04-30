import 'package:flutter/material.dart';

class TransparentHintTextField extends StatefulWidget {
  final String text;
  final String hint;
  final bool isHintVisible;
  final ValueChanged<String> onValueChange;
  final ValueChanged<bool> onFocusChange;
  final TextStyle textStyle;
  final bool singleLine;

  const TransparentHintTextField({
    super.key,
    required this.text,
    required this.hint,
    required this.onValueChange,
    required this.onFocusChange,
    this.isHintVisible = true,
    this.textStyle = const TextStyle(color: Colors.black),
    this.singleLine = false,
  });

  @override
  State<TransparentHintTextField> createState() =>
      _TransparentHintTextFieldState();
}

class _TransparentHintTextFieldState extends State<TransparentHintTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      widget.onFocusChange(_focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(covariant TransparentHintTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != _controller.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onValueChange,
      maxLines: widget.singleLine ? 1 : null,
      style: widget.textStyle,
      decoration: InputDecoration(
        hintText: widget.isHintVisible ? widget.hint : null,
        hintStyle: widget.textStyle,
        border: InputBorder.none,
        isCollapsed: true,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
