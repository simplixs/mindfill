import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/supabase_config.dart';
import 'core/app_colors.dart';
import 'features/auth/repositories/auth_repository.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/neural_network/repositories/profile_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await ProfileRepository().init();

  try {
    await SupabaseConfig.initialize();
  } catch (e) {
    debugPrint('Supabase initialization failed: $e');
  }

  runApp(
    const ProviderScope(
      child: MindFillApp(),
    ),
  );
}

class MindFillApp extends ConsumerWidget {
  const MindFillApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = ref.watch(supabaseClientProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindFill',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.apply(
            bodyColor: AppColors.primaryText,
            displayColor: AppColors.primaryText,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryText,
          surface: AppColors.surface,
          background: AppColors.background,
          secondary: AppColors.accent,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder<AuthState>(
        stream: ref.read(authRepositoryProvider).authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          
          final session = snapshot.data?.session;
          if (session != null) {
            return const DashboardScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
