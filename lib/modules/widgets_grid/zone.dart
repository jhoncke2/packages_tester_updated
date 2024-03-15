import 'package:flutter/material.dart';

enum ZoneSide{
  left,
  top,
  right,
  bottom
}

class Zone{
  final Offset init;
  final Offset end;
  const Zone({
    required this.init,
    required this.end
  });
}