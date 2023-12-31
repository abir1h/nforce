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
    return widget.isLoading
        ? Stack(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Opacity(
                  opacity: 0.2,
                  child: widget.child,
                ),
              ),
              Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                ),
              ),
            ],
          )
        : widget.child;
  }
}
