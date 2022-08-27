
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class CanvasPreview extends StatelessWidget {
  const CanvasPreview({
    Key? key,
    required this.path,
    required this.height,
    required this.coreInfo,
  }) : super(key: key);

  final String path;
  final int pageIndex = 0;

  final double? height;
  final EditorCoreInfo coreInfo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path-page$pageIndex",

      child: InteractiveCanvasViewer(
        maxScale: 5,
        scrollZoomEnabled: false,

        child: FittedBox(
          child: InnerCanvas(
            width: Canvas.canvasWidth,
            height: height ?? Canvas.canvasHeight * 0.1,
            coreInfo: coreInfo,
            currentStroke: null,
          ),
        ),
      ),
    );
  }
}
