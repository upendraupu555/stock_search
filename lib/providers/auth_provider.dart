import 'package:email_validator/email_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market_search/core/api_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<String?>>(
    (ref) => AuthNotifier());
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

class AuthNotifier extends StateNotifier<AsyncValue<String?>> {
  AuthNotifier() : super(const AsyncValue.loading()) {
    checkLoginStatus();
  }

  final ApiService _apiService = ApiService();

  bool isVisible = false;

  Future<String?> login(
    String email,
    String password,
  ) async {
    state = const AsyncValue.loading();

    try {
      final token = await _apiService.login(email, password);
      state = AsyncValue.data(token.jwt);
      final prefs = await SharedPreferences.getInstance();

      return prefs.getString("auth_token");
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    state = const AsyncValue.data(null);
    return null;
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    state = AsyncValue.data(token);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    state = const AsyncValue.data(null);
  }

  bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  toggleVisible() {
    isVisible = !isVisible;
    state = AsyncValue.data(state.value);
  }
}
