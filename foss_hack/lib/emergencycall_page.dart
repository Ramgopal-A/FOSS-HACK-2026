import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  Widget emergencyButton(Color color, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {},
          child: Row(
            children: [
              const SizedBox(width: 20),

              Icon(icon, size: 35, color: Colors.white),

              const SizedBox(width: 20),

              Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 238, 237),
        title: const Text(
          "Emergency Help",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 30),

          /// SOS Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SOS",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      "EMERGENCY",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Press if you need immediate help",
            style: TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 20),

          emergencyButton(Color(0xFF2D4A9D), Icons.call, "Call Emergency"),
          emergencyButton(Color(0xFF2F6ED3), Icons.local_police, "Call Police"),
          emergencyButton(
            Color(0xFF146C43),
            Icons.medical_services,
            "Call Ambulance",
          ),
          emergencyButton(
            const Color.fromARGB(255, 243, 76, 64),
            Icons.local_fire_department,
            "Call Fire Service",
          ),
        ],
      ),
    );
  }
}
