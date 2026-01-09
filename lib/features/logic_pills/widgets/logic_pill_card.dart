import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfill/core/app_colors.dart';
import 'package:mindfill/features/logic_pills/models/logic_pill.dart';

class LogicPillCard extends StatefulWidget {
  final LogicPill pill;
  final VoidCallback onDismiss;

  const LogicPillCard({
    super.key,
    required this.pill,
    required this.onDismiss,
  });

  @override
  State<LogicPillCard> createState() => _LogicPillCardState();
}

class _LogicPillCardState extends State<LogicPillCard> {
  String? _selectedOption;
  bool _showExplanation = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.pill.type.replaceAll('_', ' ').toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  color: AppColors.accent,
                  letterSpacing: 2,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.subText),
                onPressed: widget.onDismiss,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pill.question,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ...widget.pill.options.map((option) => _buildOption(option)),
                  if (_showExplanation) ...[
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedOption == widget.pill.correctAnswer
                              ? Colors.green.withOpacity(0.3)
                              : Colors.red.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedOption == widget.pill.correctAnswer ? 'CORRECT' : 'INCORRECT',
                            style: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.bold,
                              color: _selectedOption == widget.pill.correctAnswer ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.pill.explanation,
                            style: GoogleFonts.inter(color: AppColors.primaryText, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (_showExplanation)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: widget.onDismiss,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('FINISH', style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    final bool isSelected = _selectedOption == option;
    final bool isCorrect = option == widget.pill.correctAnswer;
    
    Color borderColor = Colors.white12;
    if (_showExplanation) {
      if (isCorrect) borderColor = Colors.green;
      else if (isSelected) borderColor = Colors.red;
    } else if (isSelected) {
      borderColor = AppColors.accent;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: _showExplanation 
            ? null 
            : () {
                HapticFeedback.selectionClick();
                setState(() {
                  _selectedOption = option;
                  _showExplanation = true;
                });
              },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  option,
                  style: GoogleFonts.inter(
                    color: isSelected ? Colors.white : AppColors.subText,
                  ),
                ),
              ),
              if (_showExplanation && isCorrect)
                const Icon(Icons.check_circle, color: Colors.green, size: 20),
              if (_showExplanation && isSelected && !isCorrect)
                const Icon(Icons.cancel, color: Colors.red, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
