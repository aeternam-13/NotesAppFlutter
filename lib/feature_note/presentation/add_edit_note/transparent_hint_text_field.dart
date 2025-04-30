import 'package:flutter/material.dart';

class TransparentHintTextField extends StatefulWidget {
  const TransparentHintTextField({
    super.key,
    required this.text,
    required this.hint,
    required this.onValueChange,

    this.isHintVisible = true,
    this.textStyle = const TextStyle(color: Colors.black),
    this.singleLine = false,
  });

  final String text;
  final String hint;
  final bool isHintVisible;
  final ValueChanged<String> onValueChange;
  final TextStyle textStyle;
  final bool singleLine;

  @override
  State<TransparentHintTextField> createState() =>
      _TransparentHintTextFieldState();
}

class _TransparentHintTextFieldState extends State<TransparentHintTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onValueChange,
      maxLines: widget.singleLine ? 1 : null,
      style: widget.textStyle,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.textStyle,
        border: InputBorder.none,
        isCollapsed: true,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
