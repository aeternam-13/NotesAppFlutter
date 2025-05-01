import 'package:flutter/material.dart';

class SafeScope extends StatefulWidget {
  const SafeScope({
    super.key,
    this.drawer,
    this.appBar,
    required this.child,
    this.floatingButton,
    this.resize = true,
  });

  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? floatingButton;
  final Widget child;
  final bool resize;

  @override
  State<SafeScope> createState() => _SafeScopeState();
}

class _SafeScopeState extends State<SafeScope> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: widget.resize,
        drawer: widget.drawer,
        appBar: widget.appBar,
        floatingActionButton: widget.floatingButton,
        body: SafeArea(child: widget.child),
      ),
    );
  }
}
