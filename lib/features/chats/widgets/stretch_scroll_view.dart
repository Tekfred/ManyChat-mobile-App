import 'package:flutter/material.dart';

class StretchScrollView extends StatefulWidget {
  final Widget child;
  final double maxStretch;
  final double stretchFactor;

  const StretchScrollView({
    super.key,
    required this.child,
    this.maxStretch = 80,
    this.stretchFactor = 0.3,
  });

  @override
  State<StretchScrollView> createState() => _StretchScrollViewState();
}

class _StretchScrollViewState extends State<StretchScrollView>
    with SingleTickerProviderStateMixin {
  late AnimationController _stretchController;
  late Animation<double> _stretchAnimation;
  double _currentStretch = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _stretchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _stretchAnimation = CurvedAnimation(
      parent: _stretchController,
      curve: Curves.easeOutCubic,
    );
    _stretchController.addListener(() {
      setState(() {
        _currentStretch = _stretchAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _stretchController.dispose();
    super.dispose();
  }

  void _onStretchStart() {
    _stretchController.stop();
    setState(() {
      _isDragging = true;
    });
  }

  void _onStretchUpdate(double delta) {
    if (delta > 0) {
      setState(() {
        _currentStretch = delta * widget.stretchFactor;
        if (_currentStretch > widget.maxStretch) {
          _currentStretch = widget.maxStretch;
        }
      });
    }
  }

  void _onStretchEnd() {
    setState(() {
      _isDragging = false;
    });
    if (_currentStretch > 0) {
      _stretchController.reverse(from: _currentStretch / widget.maxStretch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification &&
            notification.metrics.pixels <= 0) {
          _onStretchStart();
        }
        if (notification is ScrollUpdateNotification) {
          if (notification.metrics.pixels < 0) {
            _onStretchUpdate(-notification.metrics.pixels);
          }
        }
        if (notification is ScrollEndNotification) {
          _onStretchEnd();
        }
        return false;
      },
      child: Transform.translate(
        offset: Offset(0, _currentStretch * 0.5),
        child: Transform.scale(
          scale: 1.0 + (_currentStretch / widget.maxStretch) * 0.02,
          child: widget.child,
        ),
      ),
    );
  }
}