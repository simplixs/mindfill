import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

class ProfileRepository {
  static const String boxName = 'profile_box';
  
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  Box get _box => Hive.box(boxName);

  Map<String, int> getLevels() {
    final levels = _box.get('levels', defaultValue: {
      'logic': 1,
      'literature': 1,
      'science': 1,
    });
    return Map<String, int>.from(levels);
  }

  int getNeuralScore() {
    return _box.get('neural_score', defaultValue: 0);
  }

  Future<void> incrementLevel(String category) async {
    final levels = getLevels();
    levels[category] = (levels[category] ?? 0) + 1;
    await _box.put('levels', levels);
    
    final currentScore = getNeuralScore();
    await _box.put('neural_score', currentScore + 10);
  }
}
