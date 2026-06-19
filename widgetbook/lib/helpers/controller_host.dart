import 'package:flutter/material.dart';

class ControllerHost extends StatefulWidget {
  const ControllerHost({
    super.key,
    required this.builder,
    this.initialText = '',
  });

  final String initialText;
  final Widget Function(BuildContext context, TextEditingController controller)
      builder;

  @override
  State<ControllerHost> createState() => _ControllerHostState();
}

class _ControllerHostState extends State<ControllerHost> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _controller);
}
