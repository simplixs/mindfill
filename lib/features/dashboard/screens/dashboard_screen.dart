import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfill/core/app_colors.dart';
import 'package:mindfill/core/services/ai_content_service.dart';
import 'package:mindfill/features/auth/repositories/auth_repository.dart';
import 'package:mindfill/features/flash_book/widgets/flash_book_card.dart';
import 'package:mindfill/features/logic_pills/widgets/logic_pill_card.dart';
import 'package:mindfill/features/neural_network/widgets/neural_network_graph.dart';
import 'package:mindfill/features/neural_network/repositories/profile_repository.dart';
import 'package:mindfill/common/widgets/shimmer_loader.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _isLoading = false;

  Future<void> _startFlashBook() async {
    final title = await _showInputDialog('Enter Book Title', 'e.g. Meditations by Marcus Aurelius');
    if (title == null || title.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final book = await ref.read(aiContentServiceProvider).generateFlashBook(title);
      if (mounted) {
        _showFullScreenOverlay(FlashBookCard(
          book: book,
          onDismiss: () async {
            await ref.read(profileRepositoryProvider).incrementLevel('literature');
            if (mounted) Navigator.pop(context);
          },
        ));
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _startLogicPill() async {
    setState(() => _isLoading = true);
    try {
      final pill = await ref.read(aiContentServiceProvider).generateLogicPill(userLevel: 5);
      if (mounted) {
        _showFullScreenOverlay(LogicPillCard(
          pill: pill,
          onDismiss: () async {
            await ref.read(profileRepositoryProvider).incrementLevel('logic');
            if (mounted) Navigator.pop(context);
          },
        ));
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showFullScreenOverlay(Widget content) {
    showGeneralPage(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: content,
        );
      },
    );
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $message'), backgroundColor: Colors.red),
      );
    }
  }

  Future<String?> _showInputDialog(String title, String hint) async {
    String value = "";
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(title, style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 16)),
        content: TextField(
          autofocus: true,
          onChanged: (v) => value = v,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(color: AppColors.subText),
          ),
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(onPressed: () => Navigator.pop(context, value), child: const Text('START')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MINDFILL',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.person_outline, color: AppColors.subText),
                        onPressed: () => ref.read(authRepositoryProvider).signOut(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Text(
                    'Focus on what matters.',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildActionCard(
                    title: 'FLASH BOOKS',
                    subtitle: 'Summarize wisdom in 3 concepts.',
                    icon: Icons.auto_stories,
                    onTap: _startFlashBook,
                  ),
                  const SizedBox(height: 16),
                  _buildActionCard(
                    title: 'LOGIC PILLS',
                    subtitle: 'Wake up your mind in 2 mins.',
                    icon: Icons.psychology,
                    onTap: _startLogicPill,
                  ),
                  const Spacer(),
                  NeuralNetworkGraph(levels: ref.watch(profileRepositoryProvider).getLevels()),
                  const SizedBox(height: 20),
                  _buildNeuralStats(),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: AppColors.background,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoader(width: 100, height: 20),
                      const SizedBox(height: 60),
                      ShimmerLoader(width: 250, height: 40),
                      const SizedBox(height: 40),
                      ShimmerLoader(width: double.infinity, height: 100, borderRadius: 12),
                      const SizedBox(height: 16),
                      ShimmerLoader(width: double.infinity, height: 100, borderRadius: 12),
                      const Spacer(),
                      ShimmerLoader(width: double.infinity, height: 150),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: _isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accent, size: 32),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: AppColors.subText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.subText),
          ],
        ),
      ),
    );
  }

  Widget _buildNeuralStats() {
    final levels = ref.watch(profileRepositoryProvider).getLevels();
    final score = ref.watch(profileRepositoryProvider).getNeuralScore();

    return Column(
      children: [
        Text(
          'NEURAL SCORE: $score',
          style: GoogleFonts.jetBrainsMono(fontSize: 12, color: AppColors.accent, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceGrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem('LOGIC', 'Lv. ${levels['logic']}'),
              _statItem('LIT', 'Lv. ${levels['literature']}'),
              _statItem('SCI', 'Lv. ${levels['science']}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(fontSize: 10, color: AppColors.subText),
        ),
        Text(
          value,
          style: GoogleFonts.jetBrainsMono(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

void showGeneralPage({required BuildContext context, required Widget Function(BuildContext, Animation<double>, Animation<double>) pageBuilder}) {
  Navigator.push(context, PageRouteBuilder(
    pageBuilder: pageBuilder,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOutCubic;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  ));
}
