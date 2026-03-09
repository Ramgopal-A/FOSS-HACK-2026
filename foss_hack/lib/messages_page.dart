import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  Widget messageCard(
    IconData icon,
    String name,
    String message, {
    Color color = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 35),
                const SizedBox(width: 15),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(message, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 228, 231),
        title: const Text(
          "Messages",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          messageCard(Icons.person, "John (Son)", "Dinner at 8 tonight"),

          messageCard(
            Icons.warning,
            "Unknown Sender",
            "URGENT! Send money immediately!\n\n⚠ This message may be unsafe",
            color: const Color(0xFFEAD9A7),
          ),

          messageCard(
            Icons.person,
            "Sarah (Daughter)",
            "How are you feeling today?",
          ),

          messageCard(Icons.person, "Alex (Grandson)", "Love you Grandpa ❤️"),
        ],
      ),
    );
  }
}
