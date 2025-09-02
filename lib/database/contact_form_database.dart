import 'package:supabase_flutter/supabase_flutter.dart';
import 'contact_form_model.dart';

class ContactFormDatabase {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> submitForm({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final contactForm = ContactFormModel(
        name: name,
        email: email,
        subject: subject,
        message: message,
        submittedAt: DateTime.now(),
      );

      final dataToInsert = contactForm.toMap()..remove('id');
      await _supabase.from('contact_form').insert(dataToInsert);
    } catch (e) {
      throw Exception('Failed Submit Data! $e');
    }
  }
}
