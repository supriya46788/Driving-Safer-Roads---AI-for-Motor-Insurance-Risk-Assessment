import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DriverDashboard extends StatefulWidget {
  const DriverDashboard({Key? key}) : super(key: key);

  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Random _random = Random();
  
  final double riskScore = 78.5;
  
  final List<Map<String, dynamic>> recentTrips = [
    {
      'date': 'Today, 9:30 AM',
      'from': 'Home',
      'to': 'Office',
      'distance': '12.5 km',
      'riskEvents': 2,
      'score': 82,
    },
    {
      'date': 'Yesterday, 6:15 PM',
      'from': 'Office',
      'to': 'Home',
      'distance': '13.2 km',
      'riskEvents': 1,
      'score': 88,
    },
    {
      'date': 'Yesterday, 8:20 AM',
      'from': 'Home',
      'to': 'Office',
      'distance': '12.7 km',
      'riskEvents': 3,
      'score': 75,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: riskScore / 100).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
    
    Future.delayed(const Duration(seconds: 3), () {
      _showDangerZoneAlert();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  void _showDangerZoneAlert() {
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 5),
        content: Row(
          children: const [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Caution! High accident area ahead',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Slow down. High accident probability in 500m.'),
                ],
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('Driver Dashboard Content Here'),
      ),
    );
  }
}
