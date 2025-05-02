import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/inmutable_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onTap,
  });

  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomPaint(
        painter: NotePainter(color: Color(note.color)),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 200,
            maxWidth: 450,
            minHeight: 100,
          ),
          padding: EdgeInsets.all(6),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: InmutableStyle.titleLargeLargeBlack(context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      note.content,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: InmutableStyle.bodyLargeBlack(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(onTap: onDelete, child: Icon(Icons.delete)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotePainter extends CustomPainter {
  final Color color;
  final double cornerRadius;
  final double cutCornerSize;

  NotePainter({
    required this.color,
    this.cornerRadius = 10,
    this.cutCornerSize = 30,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clipPath = Path();

    clipPath.lineTo(size.width - cutCornerSize, 0);
    clipPath.lineTo(size.width, cutCornerSize);
    clipPath.lineTo(size.width, size.height);
    clipPath.lineTo(0, size.height);
    clipPath.close();
    canvas.save();
    canvas.clipPath(clipPath);

    final paint = Paint()..color = color;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(cornerRadius),
      ),
      paint,
    );

    final blendColor = Color.alphaBlend(Colors.black.withAlpha(70), color);
    final paintShade = Paint()..color = blendColor;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width - cutCornerSize,
          -100,
          cutCornerSize + 100,
          cutCornerSize + 100,
        ),
        Radius.circular(cornerRadius),
      ),
      paintShade,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
