import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/profile/data/models/profile_model.dart';
import 'package:test1/features/profile/data/repositories/profile_repository.dart';

// Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
}); // Provider

// StateNotifier untuk mengelola state profile
class ProfileNotifier extends StateNotifier<AsyncValue<List<ProfileModel>>> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadProfileList();
  }

  /// Load data profile dalam bentuk list
  Future<void> loadProfileList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getProfileList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Refresh data profile dalam bentuk list
  Future<void> refresh() async {
    await loadProfileList();
  }
}

// Profile Notifier Provider
final profileNotifierProvider =
    StateNotifierProvider.autoDispose<
      ProfileNotifier,
      AsyncValue<List<ProfileModel>>
    >((ref) {
      final repository = ref.watch(profileRepositoryProvider);
      return ProfileNotifier(repository);
    });
