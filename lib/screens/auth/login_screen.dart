import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_search/widgets/custom_snackbar.dart';

import '../../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "Test@1234");

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoading = authState is AsyncLoading<String?>;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.trending_up, size: 80, color: Colors.blueAccent),
              const SizedBox(height: 20),
              const Text("Stock Search",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              authState.when(
                data: (token) => TextField(
                  controller: passwordController,
                  obscureText: !ref.watch(passwordVisibilityProvider),
                  // ✅ Watch only visibility state
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        ref.read(passwordVisibilityProvider.notifier).state =
                            !ref
                                .read(passwordVisibilityProvider.notifier)
                                .state;
                      },
                      icon: Icon(
                        ref.watch(passwordVisibilityProvider)
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                ),
                error: (error, stackTrace) => Container(),
                loading: () => const CircularProgressIndicator(),
              ),
              const SizedBox(height: 20),
              authState.when(
                loading: () => const CircularProgressIndicator(),
                data: (token) => Column(
                  children: [
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  ref
                                      .read(authProvider.notifier)
                                      .isValidEmail(emailController.text)) {
                                String? token =
                                    await ref.read(authProvider.notifier).login(
                                          emailController.text.trim(),
                                          passwordController.text,
                                        );
                                if (token != null && context.mounted) {
                                  context.pushReplacement('/search');
                                } else {
                                  if (context.mounted) {
                                    CustomSnackbar().errorSnackbar(
                                        context, "Error", "Login failed");
                                  }
                                }
                              } else if (emailController.text.isEmpty) {
                                CustomSnackbar().errorSnackbar(
                                    context, "Error", "Please enter email");
                              } else if (passwordController.text.isEmpty) {
                                CustomSnackbar().errorSnackbar(
                                    context, "Error", "Please enter password");
                              } else if (!ref
                                  .read(authProvider.notifier)
                                  .isValidEmail(emailController.text.trim())) {
                                CustomSnackbar().errorSnackbar(context, "Error",
                                    "Please enter valid email");
                              }
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white) // Prevents empty screen
                          : const Text("Login"),
                    ),
                  ],
                ),
                error: (err, _) => Column(
                  children: [
                    Text("Error: $err",
                        style: const TextStyle(color: Colors.red)),
                    ElevatedButton(
                      onPressed: () async {
                        await ref.read(authProvider.notifier).login(
                              emailController.text.trim(),
                              passwordController.text,
                            );
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
              if (isLoading) // Ensure loading doesn't fully block UI
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    // Semi-transparent overlay
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
