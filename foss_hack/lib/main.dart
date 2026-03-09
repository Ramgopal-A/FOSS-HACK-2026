import 'package:flutter/material.dart';
import 'voice_assistance_page.dart';
import 'messages_page.dart';
import 'emergencycall_page.dart';
import 'verified_news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// Logo
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Text("Logo")),
                ),

                const SizedBox(height: 20),

                const Text(
                  "ElderConnect",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A4F47),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Sign in to your account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0A4F47),
                  ),
                ),

                const SizedBox(height: 30),

                /// Email
                Align(alignment: Alignment.centerLeft, child: Text("Email")),
                const SizedBox(height: 8),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Password
                Align(alignment: Alignment.centerLeft, child: Text("Password")),
                const SizedBox(height: 8),

                TextField(
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?"),
                  ),
                ),

                /// Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "I've read and agreed to User Agreement and Privacy Policy",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Sign in button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A4F47),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Text("other way to sign in"),
                const SizedBox(height: 20),

                /// Social login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/300/300221.png",
                        height: 25,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/124/124010.png",
                        height: 25,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////
/// HOME PAGE
////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  Widget buildButton(
    Color color,
    IconData icon,
    String text,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            if (text == "Emergency Help") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmergencyPage()),
              );
            }

            if (text == "Voice Assistance") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VoiceAssistancePage(),
                ),
              );
            }

            if (text == "Messages") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessagesPage()),
              );
            }
            if (text == "emergencycall") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmergencyPage()),
              );
            }
            if (text == "Verified News") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerifiedNewsPage(),
                ),
              );
            }
          },

          child: Row(
            children: [
              Icon(icon, size: 35, color: Colors.white),

              const SizedBox(width: 20),

              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "ElderConnect",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 100, 75),
                        ),
                      ),

                      Text(
                        "Be Connected",
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 141, 93),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountPage()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            buildButton(Color(0xFF2D4A9D), Icons.call, "Call Family", context),
            buildButton(Color(0xFF2F6ED3), Icons.message, "Messages", context),
            buildButton(
              Color(0xFF146C43),
              Icons.article,
              "Verified News",
              context,
            ),
            buildButton(Colors.red, Icons.warning, "Emergency Help", context),
            buildButton(Colors.grey, Icons.mic, "Voice Assistance", context),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////
/// ACCOUNT PAGE
////////////////////////////////////////////////////

class AccountPage extends StatelessWidget {
  Widget buildItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),

            Icon(icon, size: 30, color: Colors.black54),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(Icons.chevron_right),

            const SizedBox(width: 15),
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
        backgroundColor: const Color(0xFF0A4F47),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Account",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          /// Profile Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),

                  SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Godson S",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "godsonjitn@gmail.com",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Spacer(),

                  Icon(Icons.edit),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Screen Settings",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          buildItem(Icons.text_fields, "Font Size"),
          buildItem(Icons.verified_user, "Trusted Contacts"),
          buildItem(Icons.groups, "Family Pairing"),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Help",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          buildItem(Icons.receipt_long, "Feedback"),
          buildItem(Icons.favorite, "Rate Us"),
          buildItem(Icons.settings, "Settings"),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
