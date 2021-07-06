import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutAppBar extends StatefulWidget implements PreferredSizeWidget {
  LayoutAppBar({Key? key}) : super(key: key);

  @override
  _LayoutAppBarState createState() => _LayoutAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _LayoutAppBarState extends State<LayoutAppBar>
    with SingleTickerProviderStateMixin {
  bool _flag = true;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (_flag) {
            _controller.forward();
          } else {
            _controller.reverse();
          }

          _flag = !_flag;
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animation,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
