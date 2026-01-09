import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_colors.dart';

class NeuralNetworkGraph extends StatelessWidget {
  final Map<String, int> levels; // e.g. {"logic": 5, "literature": 2, "science": 8}

  const NeuralNetworkGraph({super.key, required this.levels});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CustomPaint(
        painter: _NeuralGraphPainter(levels: levels),
      ),
    );
  }
}

class _NeuralNode {
  final Offset position;
  final String label;
  final double intensity; // 0.0 to 1.0

  _NeuralNode(this.position, this.label, this.intensity);
}

class _NeuralGraphPainter extends CustomPainter {
  final Map<String, int> levels;

  _NeuralGraphPainter({required this.levels});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42); // Fixed seed for consistent layout
    final center = Offset(size.width / 2, size.height / 2);
    
    final nodes = <_NeuralNode>[];
    final categories = levels.keys.toList();
    
    // Generate nodes
    for (int i = 0; i < categories.length; i++) {
      final angle = (i * 2 * pi) / categories.length;
      final radius = size.height * 0.3;
      final pos = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      final level = levels[categories[i]] ?? 0;
      nodes.add(_NeuralNode(pos, categories[i].toUpperCase(), level / 10.0));
    }

    // Add some random noise nodes
    for (int i = 0; i < 5; i++) {
      final pos = Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      );
      nodes.add(_NeuralNode(pos, "", random.nextDouble() * 0.3));
    }

    final paintLine = Paint()
      ..color = AppColors.accent.withOpacity(0.1)
      ..strokeWidth = 1.0;

    // Draw lines
    for (int i = 0; i < nodes.length; i++) {
      for (int j = i + 1; j < nodes.length; j++) {
        final dist = (nodes[i].position - nodes[j].position).distance;
        if (dist < 100) {
          paintLine.color = AppColors.accent.withOpacity(
            (1.0 - dist / 100.0) * 0.2 * nodes[i].intensity * nodes[j].intensity
          );
          canvas.drawLine(nodes[i].position, nodes[j].position, paintLine);
        }
      }
    }

    // Draw nodes
    for (final node in nodes) {
      final paintNode = Paint()
        ..color = Color.lerp(Colors.white10, AppColors.accent, node.intensity)!
        ..style = PaintingStyle.fill;

      // Glow effect
      if (node.intensity > 0.5) {
        canvas.drawCircle(
          node.position, 
          6 + (node.intensity * 4), 
          Paint()..color = AppColors.accent.withOpacity(0.2 * node.intensity)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4)
        );
      }

      canvas.drawCircle(node.position, 3 + (node.intensity * 3), paintNode);
      
      if (node.label.isNotEmpty) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: node.label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 8,
              color: AppColors.subText.withOpacity(0.8),
              letterSpacing: 1,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        textPainter.paint(canvas, node.position + const Offset(10, -10));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
