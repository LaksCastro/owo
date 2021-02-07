import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AnimatedBlur extends ImplicitlyAnimatedWidget {
  final BoxConstraints constraints;
  final Size size;
  final Widget child;
  final double sigma;
  final Duration duration;

  AnimatedBlur({
    Key key,
    this.constraints,
    this.size,
    this.child,
    @required this.sigma,
    @required this.duration,
  }) : super(key: key, duration: duration);

  @override
  _AnimatedBlurState createState() => _AnimatedBlurState();
}

class _AnimatedBlurState extends ImplicitlyAnimatedWidgetState<AnimatedBlur> {
  static const _blurredSigma = 10.0;
  static const _normalSigma = 0.0;

  Tween<double> _sigma;
  Animation<double> _sigmaAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sigma = visitor(
      _sigma,
      widget.sigma,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }

  @override
  void didUpdateTweens() {
    _sigmaAnimation = animation.drive(_sigma);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sigmaAnimation,
      child: widget.child,
      builder: (_, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigmaAnimation.value),
          child: Container(
            child: child,
          ),
        );
      },
    );
  }
}
