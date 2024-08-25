import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_ui/core/common/widgets.dart';
import 'package:guitar_ui/core/constants/palette.dart';
import 'package:guitar_ui/features/presentation/home%20page/view/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation _animation1;

  late AnimationController _entryAnimationController;
  final List<Animation> _entryAnimations = [];

  final xPos = ValueNotifier(0.0);

  @override
  void initState() {
    _animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController1, curve: Curves.easeInOut));

    _entryAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _entryAnimations.add(
      Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _entryAnimationController,
          curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
        ),
      ),
    );

    _entryAnimations.add(
      Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _entryAnimationController,
          curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
        ),
      ),
    );

    _entryAnimations.add(
      Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _entryAnimationController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
        ),
      ),
    );

    Future.delayed(
        const Duration(seconds: 2), () => _entryAnimationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _entryAnimationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log('${size.width},${size.height}');
    return GestureDetector(
      onHorizontalDragUpdate: (detail) =>
          _onDragUpdate(detail.delta.dx, size.width),
      onHorizontalDragEnd: (detail) => _onDragEnd(size.width),
      child: Scaffold(
        backgroundColor: ColorConstants.bgColor,
        body: AnimatedBuilder(
            animation: _animation1,
            builder: (context, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(_animation1.value * size.width * 0.65)
                      ..rotateY((math.pi * 0.5) * _animation1.value),
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: [
                        Transform(
                          transform: Matrix4.identity()..translate(0.0),
                          // offset: Offset(-size.width, 0),
                          child: Transform(
                            transform: Matrix4.identity()..rotateY(math.pi / 2),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: size.height,
                              width: size.width * 0.65,
                              color: ColorConstants.drawerColor,
                              child: Transform.flip(
                                flipX: true,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 50.w),
                                  child: SafeArea(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        kWidth(double.infinity),
                                        kHeight(30.h),
                                        HomePageWidget.drawerIcon(),
                                        const Spacer(),
                                        HomePageWidget.drawerButton(
                                            text: 'Guitar', isSelected: true),
                                        HomePageWidget.drawerButton(
                                            text: 'Basses'),
                                        HomePageWidget.drawerButton(
                                            text: 'Amps'),
                                        HomePageWidget.drawerButton(
                                            text: 'Pedals'),
                                        HomePageWidget.drawerButton(
                                            text: 'Others'),
                                        const Spacer(),
                                        HomePageWidget.drawerInfoText(
                                            text: 'About'),
                                        HomePageWidget.drawerInfoText(
                                            text: 'Support'),
                                        HomePageWidget.drawerInfoText(
                                            text: 'Terms'),
                                        HomePageWidget.drawerInfoText(
                                            text: 'FAQS'),
                                        kHeight(40.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height,
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorConstants.pageColor
                                    .withRed(220 -
                                        (220 ~/ 3 * _animation1.value).toInt())
                                    .withGreen(219 -
                                        (219 ~/ 3 * _animation1.value).toInt())
                                    .withBlue(196 -
                                        (196 ~/ 3 * _animation1.value).toInt()),
                                ColorConstants.pageColor,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: SafeArea(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Column(
                                    children: [
                                      kHeight(30.h),
                                      const Spacer(),
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..translate(size.width / 4, -100.h)
                                          ..rotateZ(math.pi * 0.5),
                                        child: AnimatedBuilder(
                                            animation: _entryAnimations[2],
                                            builder: (context, _) {
                                              return Transform.translate(
                                                offset: Offset(
                                                    0,
                                                    50.w *
                                                        (1 -
                                                            _entryAnimations[2]
                                                                .value)),
                                                child: Opacity(
                                                  opacity:
                                                      _entryAnimations[2].value,
                                                  child: kText(
                                                    text: 'FENDER',
                                                    fontSize: 80,
                                                    fontWeight: FontWeight.w800,
                                                    color:
                                                        ColorConstants.bgColor,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      const Spacer(),
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 0.0, 50.h),
                                        child: Opacity(
                                          opacity: (1 - _animation1.value)
                                              .toDouble(),
                                          child: AnimatedBuilder(
                                              animation: _entryAnimations[1],
                                              builder: (context, _) {
                                                return Transform.translate(
                                                  offset: Offset(
                                                      0.0,
                                                      50.h *
                                                          (1 -
                                                              _entryAnimations[
                                                                      1]
                                                                  .value)),
                                                  child: Opacity(
                                                    opacity: _entryAnimations[1]
                                                        .value,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        kText(
                                                          text:
                                                              'Fender\nAmerican\nElite Strat',
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        const Spacer(),
                                                        kText(
                                                          text: 'SPEC',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        // kWidth(5.w),
                                                        Transform.rotate(
                                                          angle: math.pi / 2,
                                                          child: Icon(
                                                            Icons.navigate_next,
                                                            size: 25.r,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                      kHeight(40.h),
                                    ],
                                  ),
                                ),
                                AnimatedBuilder(
                                    animation: _entryAnimations[0],
                                    builder: (context, _) {
                                      return Transform.translate(
                                          offset: Offset(
                                              0.0,
                                              50.h *
                                                  (1 -
                                                      _entryAnimations[0]
                                                          .value)),
                                          child: Opacity(
                                              opacity:
                                                  _entryAnimations[0].value,
                                              child: HomePageWidget
                                                  .guitarWidget()));
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset((size.width - 100.w) * _animation1.value, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 30.h),
                          child: AnimatedBuilder(
                              animation: _entryAnimations[0],
                              builder: (context, _) {
                                return Transform.translate(
                                  offset: Offset(
                                      50.w * (1 - _entryAnimations[0].value),
                                      0.0),
                                  child: Opacity(
                                    opacity: _entryAnimations[0].value,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            if (_animationController1
                                                .isCompleted) {
                                              await _animationController1
                                                  .reverse();
                                              xPos.value = 0.0;
                                            } else {
                                              await _animationController1
                                                  .animateTo(0.99);
                                              xPos.value = size.width;
                                            }
                                          },
                                          child: SizedBox(
                                            child: Icon(
                                              Icons.menu,
                                              size: 30.r,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Opacity(
                                          opacity: (1 - _animation1.value)
                                              .toDouble(),
                                          child: kText(
                                            text: 'PRODUCT DETAIL',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.menu,
                                          size: 30.r,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  void _onDragUpdate(double x, double maxWidth) {
    var newValue = xPos.value + x;
    if (newValue <= 0.0) {
      xPos.value = 0.0;
      _animationController1.value = 0.0;
    } else if (newValue >= maxWidth) {
      xPos.value = maxWidth;
      _animationController1.value = 0.9;
    } else {
      xPos.value = newValue;
      _animationController1.value = newValue / maxWidth;
    }
    log(newValue.toString());
  }

  void _onDragEnd(double maxWidth) {
    var newValue = xPos.value;

    if (newValue / maxWidth >= 0.51) {
      _animationController1.animateTo(0.99);
      xPos.value = maxWidth;
    } else {
      _animationController1.animateTo(0.0);
      xPos.value = 0.0;
    }
  }
}
