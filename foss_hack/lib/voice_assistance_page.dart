import 'package:flutter/material.dart';

class VoiceAssistancePage extends StatelessWidget {
  const VoiceAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Assistance"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.mic,
                size: 120,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            "Tap and Speak",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 10),

          const Divider(
            thickness: 1,
            indent: 60,
            endIndent: 60,
          ),

          const SizedBox(height: 10),

          const Text(
            'Example: "Call my son"',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}