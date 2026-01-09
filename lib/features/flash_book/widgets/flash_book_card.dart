import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfill/core/app_colors.dart';
import 'package:mindfill/features/flash_book/models/flash_book.dart';

class FlashBookCard extends StatefulWidget {
  final FlashBook book;
  final VoidCallback onDismiss;

  const FlashBookCard({
    super.key,
    required this.book,
    required this.onDismiss,
  });

  @override
  State<FlashBookCard> createState() => _FlashBookCardState();
}

class _FlashBookCardState extends State<FlashBookCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Progress Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: List.generate(
                widget.book.slides.length + 1, // +1 for reflection
                (index) => Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: index <= _currentPage ? AppColors.accent : Colors.white12,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) => setState(() => _currentPage = page),
              children: [
                ...widget.book.slides.map((slide) => _buildSlide(slide)),
                _buildReflection(widget.book.reflectionQuestion),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                    ),
                    child: Text('BACK', style: GoogleFonts.jetBrainsMono(color: AppColors.subText)),
                  )
                else
                  const SizedBox.shrink(),
                
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    if (_currentPage < widget.book.slides.length) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                      );
                    } else {
                      widget.onDismiss();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    _currentPage < widget.book.slides.length ? 'NEXT' : 'FINISH',
                    style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide(ConceptSlide slide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            slide.concept.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              color: AppColors.accent,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            slide.body,
            style: GoogleFonts.inter(
              fontSize: 22,
              height: 1.5,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReflection(String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'REFLECTION',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              color: AppColors.accent,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            question,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Type your thoughts...',
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintStyle: GoogleFonts.inter(color: AppColors.subText),
            ),
            style: GoogleFonts.inter(),
          ),
        ],
      ),
    );
  }
}
