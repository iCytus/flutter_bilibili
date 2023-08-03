import 'dart:math' as math;
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';

class CustomRefreshIndicator extends StatefulWidget {
  /// Indicator properties and state.
  final IndicatorState state;

  /// True for up and left.
  /// False for down and right.
  final bool reverse;

  /// Indicator foreground color.
  final Color? foregroundColor;

  /// WaterDrop background color.
  final Color? backgroundColor;

  /// Empty widget.
  /// When result is [IndicatorResult.noMore].
  final Widget? emptyWidget;

  const CustomRefreshIndicator({
    Key? key,
    required this.state,
    required this.reverse,
    this.foregroundColor,
    this.backgroundColor,
    this.emptyWidget,
  }) : super(key: key);

  @override
  State<CustomRefreshIndicator> createState() => _CustomRefreshIndicatorState();
}

class _CustomRefreshIndicatorState extends State<CustomRefreshIndicator> with SingleTickerProviderStateMixin {
  Axis get _axis => widget.state.axis;

  IndicatorMode get _mode => widget.state.mode;

  double get _offset => widget.state.offset;

  double get _actualTriggerOffset => widget.state.actualTriggerOffset;

  late AnimationController _waterDropHiddenController;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _waterDropHiddenController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    widget.state.notifier.addModeChangeListener(_onModeChange);

    _animation = IntTween(begin: 1, end: 4).animate(CurvedAnimation(parent: _waterDropHiddenController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    widget.state.notifier.removeModeChangeListener(_onModeChange);
    _waterDropHiddenController.dispose();
    super.dispose();
  }

  /// Mode change listener.
  void _onModeChange(IndicatorMode mode, double offset) {
    if (mode == IndicatorMode.ready && !_waterDropHiddenController.isAnimating) {
      _waterDropHiddenController.repeat();
    } else if (mode == IndicatorMode.inactive) {
      _waterDropHiddenController.reset();
    }
  }

  Widget _buildIndicator() {
    final scale = (_offset / _actualTriggerOffset).clamp(0.01, 0.99);
    Widget indicator;
    switch (_mode) {
      case IndicatorMode.drag:
      case IndicatorMode.armed:
        const Curve opacityCurve = Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        );
        indicator = Opacity(
          key: const ValueKey('indicator'),
          opacity: opacityCurve.transform(scale),
          child: CupertinoActivityIndicator.partiallyRevealed(
            progress: scale,
            color: widget.foregroundColor,
          ),
        );
        break;
      case IndicatorMode.ready:
      case IndicatorMode.processing:
      case IndicatorMode.processed:
        indicator = CupertinoActivityIndicator(
          key: const ValueKey('indicator'),
          color: widget.foregroundColor,
        );
        break;
      case IndicatorMode.done:
        indicator = CupertinoActivityIndicator(
          key: const ValueKey('indicator'),
          color: widget.foregroundColor,
        );
        break;
      default:
        indicator = const SizedBox(
          key: ValueKey('indicator'),
        );
        break;
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        String frame = _animation.value.toString();
        return Image.asset(
          "assets/images/custom/pull_loading_${frame}60x60.png",
          gaplessPlayback: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double offset = _offset;
    if (widget.state.indicator.infiniteOffset != null &&
        widget.state.indicator.position == IndicatorPosition.locator &&
        (_mode != IndicatorMode.inactive || widget.state.result == IndicatorResult.noMore)) {
      offset = _actualTriggerOffset;
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: _axis == Axis.vertical ? offset : double.infinity,
          width: _axis == Axis.vertical ? double.infinity : offset,
        ),
        // Indicator.
        Positioned(
          top: 0,
          left: 0,
          right: _axis == Axis.vertical ? 0 : null,
          bottom: _axis == Axis.vertical ? null : 0,
          child: Container(
            alignment: Alignment.center,
            height: _axis == Axis.vertical ? _actualTriggerOffset : double.infinity,
            width: _axis == Axis.vertical ? double.infinity : _actualTriggerOffset,
            child: _buildIndicator(),
          ),
        ),
      ],
    );
  }
}
