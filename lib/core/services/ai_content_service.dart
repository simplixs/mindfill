import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mindfill/core/supabase_config.dart';
import 'package:mindfill/features/flash_book/models/flash_book.dart';
import 'package:mindfill/features/logic_pills/models/logic_pill.dart';

final aiContentServiceProvider = Provider<AIContentService>((ref) {
  return AIContentService(ref.watch(supabaseClientProvider));
});

class AIContentService {
  final SupabaseClient _supabase;
  AIContentService(this._supabase);

  Future<FlashBook> generateFlashBook(String query) async {
    final response = await _supabase.functions.invoke(
      'gemini-proxy',
      body: {'category': 'flash_book', 'query': query},
    );

    if (response.status != 200) {
      throw Exception('Failed to generate flash book: ${response.data}');
    }

    return FlashBook.fromJson(response.data);
  }

  Future<LogicPill> generateLogicPill({required int userLevel}) async {
    final response = await _supabase.functions.invoke(
      'gemini-proxy',
      body: {'category': 'logic_pill', 'user_level': userLevel},
    );

    if (response.status != 200) {
      throw Exception('Failed to generate logic pill: ${response.data}');
    }

    return LogicPill.fromJson(response.data);
  }
}
