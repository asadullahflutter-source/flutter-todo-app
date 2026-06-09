import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient supabase = Supabase.instance.client;

  // ── Sign Up ──────────────────────────────────────────────
  static Future<AuthResponse> signup(
    String name,
    String username,
    String email,
    String password,
  ) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'username': username,
      },
    );

    final user = response.user;

    if (user != null) {
      await supabase.from('profiles').upsert({
        'id': user.id,
        'name': name,
        'username': username,
        'email': email,
      });
    }

    return response;
  }

  // ── Login ────────────────────────────────────────────────
  static Future<AuthResponse> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // ── Logout ───────────────────────────────────────────────
  static Future<void> logout() async {
    await supabase.auth.signOut();
  }

  // ── Current User ─────────────────────────────────────────
  static User? get currentUser => supabase.auth.currentUser;

  // ── Get Profile ──────────────────────────────────────────
  static Future<Map<String, dynamic>?> getProfile() async {
    final user = currentUser;
    if (user == null) return null;

    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return response;
  }

  // ── Update Profile ───────────────────────────────────────
 static Future<void> updateProfile({
  String? name,
  String? username,
}) async {
  final user = currentUser;
  if (user == null) return;

  await supabase.from('profiles').update({
    'name': name ?? '',
    'username': username ?? '',
  }).eq('id', user.id);
}
}