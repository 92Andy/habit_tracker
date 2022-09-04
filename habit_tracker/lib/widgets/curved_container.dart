import 'package:flutter/material.dart';

enum ContainerCurveType {
  top,
  bottom,
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    Key? key,
    this.child,
    this.color = Colors.white,
    this.height = 200,
    this.boxDecoration,
    this.curveType = ContainerCurveType.top,
  }) : super(key: key);

  final double height;
  final Color color;
  final Widget? child;
  final BoxDecoration? boxDecoration;
  final ContainerCurveType curveType;

  CustomClipper<Path> parseCurveTypeToClipper(ContainerCurveType type) {
    switch (type) {
      case ContainerCurveType.top:
        return _TopCurveClipper();
      case ContainerCurveType.bottom:
        return _BottomCurveClipper();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: parseCurveTypeToClipper(curveType),
      child: Container(
        decoration: boxDecoration,
        height: height,
        width: MediaQuery.of(context).size.width,
        color: boxDecoration != null ? null : color,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  final double leftRightEdgeYHeight = 40;

  Offset leftCurvePoint(Size size) =>
      Offset(size.width * .375, size.height - leftRightEdgeYHeight + 5);
  Offset leftEndPoint(Size size) =>
      Offset(size.width * .425, size.height - leftRightEdgeYHeight + 20);

  Offset middleCurvePoint(Size size) => Offset(size.width * .5, size.height);
  Offset middleEndPoint(Size size) =>
      Offset(size.width * .575, size.height - leftRightEdgeYHeight + 20);

  Offset rightCurvePoint(Size size) =>
      Offset(size.width * .625, size.height - leftRightEdgeYHeight + 5);
  Offset rightEndPoint(Size size) =>
      Offset(size.width * .75, size.height - leftRightEdgeYHeight + 5);

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height - leftRightEdgeYHeight) // p1
      ..lineTo(size.width * 0.25, size.height - leftRightEdgeYHeight + 5)
      ..quadraticBezierTo(
        leftCurvePoint(size).dx,
        leftCurvePoint(size).dy,
        leftEndPoint(size).dx,
        leftEndPoint(size).dy,
      )
      ..quadraticBezierTo(
        middleCurvePoint(size).dx,
        middleCurvePoint(size).dy,
        middleEndPoint(size).dx,
        middleEndPoint(size).dy,
      )
      ..quadraticBezierTo(
        rightCurvePoint(size).dx,
        rightCurvePoint(size).dy,
        rightEndPoint(size).dx,
        rightEndPoint(size).dy,
      )
      ..lineTo(size.width, size.height - leftRightEdgeYHeight) // p2
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _TopCurveClipper extends CustomClipper<Path> {
  final double leftRightEdgeYHeight = 40;

  Offset leftCurvePoint(Size size) => Offset(size.width * .625, 37.5);
  Offset leftEndPoint(Size size) => Offset(size.width * .575, 22.5);

  Offset middleCurvePoint(Size size) => Offset(size.width * .5, 0);
  Offset middleEndPoint(Size size) => Offset(size.width * .425, 22.5);

  Offset rightCurvePoint(Size size) => Offset(size.width * .375, 37.5);
  Offset rightEndPoint(Size size) => Offset(size.width * .25, 37.5);

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, leftRightEdgeYHeight)
      ..lineTo(0, size.height) // p1
      ..lineTo(size.width, size.height) // p2
      ..lineTo(size.width, leftRightEdgeYHeight)
      ..lineTo(size.width * 0.75, 37.5) // p3
      ..quadraticBezierTo(
        leftCurvePoint(size).dx,
        leftCurvePoint(size).dy,
        leftEndPoint(size).dx,
        leftEndPoint(size).dy,
      )
      ..quadraticBezierTo(
        middleCurvePoint(size).dx,
        middleCurvePoint(size).dy,
        middleEndPoint(size).dx,
        middleEndPoint(size).dy,
      )
      ..quadraticBezierTo(
        rightCurvePoint(size).dx,
        rightCurvePoint(size).dy,
        rightEndPoint(size).dx,
        rightEndPoint(size).dy,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
