import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaScrollbar extends RawScrollbar {
  const MegaScrollbar({
    Key? key,
    required Widget child,
    ScrollController? controller,
    bool isAlwaysShown = false,
    ScrollNotificationPredicate? notificationPredicate,
    ScrollbarOrientation? scrollbarOrientation,
  }) : super(
          key: key,
          child: child,
          controller: controller,
          isAlwaysShown: isAlwaysShown,
          notificationPredicate:
              notificationPredicate ?? defaultScrollNotificationPredicate,
          scrollbarOrientation: scrollbarOrientation,
        );

  @override
  RawScrollbarState<MegaScrollbar> createState() => _MegaScrollbarState();
}

class _MegaScrollbarState extends RawScrollbarState<MegaScrollbar> {
  @override
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = MegaStyle.accentColor1
      ..textDirection = Directionality.of(context)
      ..thickness = MegaStyle.halfPadding
      ..mainAxisMargin = MegaStyle.halfPadding
      ..crossAxisMargin = MegaStyle.halfPadding
      ..radius = const Radius.circular(MegaStyle.borderRadiusSize)
      ..padding = MediaQuery.of(context).padding
      ..minLength = MegaStyle.buttonSize
      ..minOverscrollLength = MegaStyle.padding
      ..scrollbarOrientation = widget.scrollbarOrientation;
  }

  double _pressStartAxisPosition = 0.0;

  @override
  void handleThumbPressStart(Offset localPosition) {
    super.handleThumbPressStart(localPosition);
    final Axis direction = getScrollbarDirection()!;
    switch (direction) {
      case Axis.vertical:
        _pressStartAxisPosition = localPosition.dy;
        break;
      case Axis.horizontal:
        _pressStartAxisPosition = localPosition.dx;
        break;
    }
  }

  @override
  void handleThumbPress() {
    if (getScrollbarDirection() == null) return;
    super.handleThumbPress();
  }

  @override
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    final Axis? direction = getScrollbarDirection();
    if (direction == null) return;
    super.handleThumbPressEnd(localPosition, velocity);
    switch (direction) {
      case Axis.vertical:
        if (velocity.pixelsPerSecond.dy.abs() < 10 &&
            (localPosition.dy - _pressStartAxisPosition).abs() > 0) {
          HapticFeedback.mediumImpact();
        }
        break;
      case Axis.horizontal:
        if (velocity.pixelsPerSecond.dx.abs() < 10 &&
            (localPosition.dx - _pressStartAxisPosition).abs() > 0) {
          HapticFeedback.mediumImpact();
        }
        break;
    }
  }
}
