import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatefulWidget {
  const CustomLoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  State<CustomLoadingWidget> createState() => _CustomLoadingWidgetState();
}

class _CustomLoadingWidgetState extends State<CustomLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: widget.isLoading,
          child: Opacity(
            opacity: widget.isLoading ? (Theme.of(context).brightness == Brightness.dark ? 0.2 : 0.2) : 1,
            child: widget.child,
          ),
        ),
        if (widget.isLoading)
          Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),
      ],
    );
  }
}
