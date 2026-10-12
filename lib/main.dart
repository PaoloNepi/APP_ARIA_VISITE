import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VisiteBimbaApp());
}

class VisiteBimbaApp extends StatelessWidget {
  const VisiteBimbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visite Bimba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8E4956)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController _controller;

  // SOSTITUISCI CON L'URL DELLA TUA WEB APP GOOGLE APPS SCRIPT
  final String webAppUrl = "https://script.google.com/macros/s/AKfycbzGjI_I1EHrcDxte_BQ3_FiYyixYaMkTrJO7GjkX8zxBmuDbbL39zJ2A4aRwQpAKXrCOg/exec";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(webAppUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario Visite Bimba'),
        backgroundColor: const Color(0xFF8E4956),
        foregroundColor: Colors.white,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
