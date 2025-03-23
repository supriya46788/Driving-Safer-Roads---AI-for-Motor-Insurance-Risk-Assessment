import 'package:flutter/material.dart';

class RiskDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Risk Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Risk Dashboard",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Your real-time driving analytics will appear here...",
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
