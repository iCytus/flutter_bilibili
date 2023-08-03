import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'custom_refresh_indicator.dart';

class CustomRefreshHeader extends Header {
  final Key? key;

  /// Indicator foreground color.
  final Color? foregroundColor;

  /// WaterDrop background color.
  final Color? backgroundColor;

  /// Empty widget.
  /// When result is [IndicatorResult.noMore].
  final Widget? emptyWidget;

  const CustomRefreshHeader({
    this.key,
    double triggerOffset = 60,
    bool clamping = false,
    IndicatorPosition position = IndicatorPosition.behind,
    Duration processedDuration = Duration.zero,
    SpringDescription? spring,
    SpringBuilder? readySpringBuilder,
    bool springRebound = false,
    FrictionFactor? frictionFactor,
    bool safeArea = true,
    double? infiniteOffset,
    bool? hitOver,
    bool? infiniteHitOver,
    bool hapticFeedback = false,
    this.foregroundColor,
    this.backgroundColor,
    this.emptyWidget,
  }) : super(
    triggerOffset: triggerOffset,
    clamping: clamping,
    processedDuration: processedDuration,
    spring: spring,
    readySpringBuilder: readySpringBuilder,
    springRebound: springRebound,
    frictionFactor: frictionFactor ??
        (infiniteOffset == null
            ? kCupertinoFrictionFactor
            : null),
    horizontalFrictionFactor: kCupertinoHorizontalFrictionFactor,
    safeArea: safeArea,
    infiniteOffset: infiniteOffset,
    hitOver: hitOver,
    infiniteHitOver: infiniteHitOver,
    position: position,
    hapticFeedback: hapticFeedback,
  );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return CustomRefreshIndicator(
      key: key,
      state: state,
      reverse: state.reverse,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      emptyWidget: emptyWidget,
    );
  }
}
