import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/app_images.dart';

class SplashBodyView extends StatefulWidget {
  const SplashBodyView({super.key});

  @override
  State<SplashBodyView> createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    initAnimation();

    goPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, _) {
            return FadeTransition(
              opacity: animation,
              child: AspectRatio(
                aspectRatio: 4 / 1,
                child: SvgPicture.asset(Assets.imagesLogo),
              ),
            );
          },
        ),
      ],
    );
  }

  void initAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goPage() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(AppRouters.homeView);
    });
  }
}
