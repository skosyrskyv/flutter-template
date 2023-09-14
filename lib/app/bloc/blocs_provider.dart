import 'package:flutter/material.dart';

class BlocsProvider extends StatelessWidget {
  final Widget child;
  const BlocsProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
    // return MultiBlocProvider(
    //   providers: [
    //   ],
    //   child: child,
    // );
  }
}
