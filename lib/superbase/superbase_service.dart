//import "package:bus_buddy/superbase/authenticationservice.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";

//import apos;package:supabase/supabase.dartapos;;

/*class SupabaseService {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjd2xpcnBhZXBkYWpzcHZjZ2JqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE3MDQ2OTcsImV4cCI6MjAyNzI4MDY5N30.fIru5Ih1mE5NwR2fS87JYGhLARFG2RZq8gMv1nCdxAU";
  static const String APIURL = "https://bcwlirpaepdajspvcgbj.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
  static void initializeSupabase() {
    //initialize supabase instance
  }
}
*/
/*void main() {
  // Initialize Supabase client somewhere in your app
  final supabaseClient = SupabaseClient(
      "https://bcwlirpaepdajspvcgbj.supabase.co",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjd2xpcnBhZXBkYWpzcHZjZ2JqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE3MDQ2OTcsImV4cCI6MjAyNzI4MDY5N30.fIru5Ih1mE5NwR2fS87JYGhLARFG2RZq8gMv1nCdxAU");

  // Create an instance of AuthenticationService
  final authService = AuthenticationService(supabaseClient);

  // Call the signUp method with the user's details
  authService.signUp(
    email: 'user@example.com',
    password: 'securepassword',
    fullname: 'John Doe',
    phoneNumber: '1234567890',
  );
}

Future<void> client() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://bcwlirpaepdajspvcgbj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjd2xpcnBhZXBkYWpzcHZjZ2JqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE3MDQ2OTcsImV4cCI6MjAyNzI4MDY5N30.fIru5Ih1mE5NwR2fS87JYGhLARFG2RZq8gMv1nCdxAU');
}

final supabase = Supabase.instance.client;


void main() {
  SupabaseClient supabase = SupabaseClient(
    'https://bcwlirpaepdajspvcgbj.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjd2xpcnBhZXBkYWpzcHZjZ2JqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE3MDQ2OTcsImV4cCI6MjAyNzI4MDY5N30.fIru5Ih1mE5NwR2fS87JYGhLARFG2RZq8gMv1nCdxAU',
  );
}*/
