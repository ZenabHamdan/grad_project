import 'package:grad_project/exports/exports.dart';

class CurvedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    double x1 = 90.w, y1 = 50.h;
    double x2 = size.width.w, y2 = -40.h;
    double x3 = size.width.w, y3 = size.height.h;
    double x4 = 50.w, y4 = size.height.h;
    double x5 = 78.w, y5 = 9.5.h;
    double x6 = 39.w, y6= 90.h;

    path.moveTo(x5, y5);
    path.lineTo(x2, y2);
    path.lineTo(x3, y3);
    path.lineTo(x4, y4);
    path.lineTo(x6, y6);
    path.lineTo(x1, y1);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 48.w
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromCircle(center: Offset(size.width.w / 2, size.height.h / 2), radius: 40.r);

    canvas.translate(size.width.w / 2, size.height.h / 2);
    canvas.rotate(1.56.r);
    canvas.translate(-size.width.w / 2, -size.height.h / 2);

    canvas.drawArc(rect, 0, 3.14.r, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



