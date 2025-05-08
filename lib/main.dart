import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://tlipjdfcqhwaxemhnkgb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRsaXBqZGZjcWh3YXhlbWhua2diIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY3MDk5NjYsImV4cCI6MjA2MjI4NTk2Nn0.AGBywCjvQm3XZKU76L_Vg3WaqVpWwMh2Ir344T0TI-c',
  );
  setupGetit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
