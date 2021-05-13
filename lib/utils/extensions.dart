import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Offset get centeredOffset {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y))
          .center;
    } else {
      return null;
    }
  }
}
