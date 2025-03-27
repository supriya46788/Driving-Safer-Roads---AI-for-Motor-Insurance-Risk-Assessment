import 'package:flutter/material.dart';
import 'dart:math';

class InsurerDashboard extends StatefulWidget {
  const InsurerDashboard({Key? key}) : super(key: key);

  @override
  State<InsurerDashboard> createState() => _InsurerDashboardState();
}

class _InsurerDashboardState extends State<InsurerDashboard> {
  final Random _random = Random();
  final List<Map<String, dynamic>> drivers = [
    {
      'name': 'John Smith',
      'id': '1248753',
      'riskScore': 92.5,
      'accidents': 0,
      'speedingEvents': 1,
      'lastActivity': '2 hours ago',
      'premium': 850,
    },
    {
      'name': 'Sarah Johnson',
      'id': '8763541',
      'riskScore': 78.3,
      'accidents': 1,
      'speedingEvents': 4,
      'lastActivity': '1 day ago',
      'premium': 1100,
    },
    {
      'name': 'Mike Thompson',
      'id': '4587236',
      'riskScore': 63.7,
      'accidents': 2,
      'speedingEvents': 8,
      'lastActivity': '3 days ago',
      'premium': 1450,
    },
    {
      'name': 'Emma Davis',
      'id': '9823561',
      'riskScore': 88.1,
      'accidents': 0,
      'speedingEvents': 2,
      'lastActivity': '12 hours ago',
      'premium': 920,
    },
    {
      'name': 'Robert Wilson',
      'id': '3652147',
      'riskScore': 71.4,
      'accidents': 1,
      'speedingEvents': 5,
      'lastActivity': '2 days ago',
      'premium': 1250,
    },
  ];

  @override
  void initState() {
    super.initState();
    
    // Simulated alert after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _showNewClaimAlert();
    });
  }
  
  void _showNewClaimAlert() {
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 5),
        content: Row(
          children: [
            const Icon(
              Icons.notification_important,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'New Claim Submitted',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Sarah Johnson has filed a new claim. Tap to review.'),
                ],
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'REVIEW',
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
        title: const Text('Insurer Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Cards
            _buildOverviewCards(),
            
            const SizedBox(height: 24),
            
            // Driver Risk Distribution
            _buildRiskDistribution(),
            
            const SizedBox(height: 24),
            
            // Driver Profiles
            _buildDriverProfiles(),
            
            const SizedBox(height: 24),
            
            // Recent Claims
            _buildRecentClaims(),
            
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'Create New Policy',
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Drivers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Claims',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
  
  Widget _buildOverviewCards() {
    return Row(
      children: [
        Expanded(
          child: _buildOverviewCard(
            'Total Drivers',
            '256',
            Icons.people,
            Colors.blue,
            '+12 this month',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildOverviewCard(
            'Open Claims',
            '18',
            Icons.assignment,
            Colors.orange,
            '5 new today',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildOverviewCard(
            'Avg. Risk Score',
            '82.4',
            Icons.security,
            Colors.green,
            '↑ 3.2% this month',
          ),
        ),
      ],
    );
  }
  
  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Existing code remains the same as your original file
  // ... (all previous code stays identical)

  Widget _buildRiskDistribution() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Driver Risk Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'Risk Distribution Chart Placeholder',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Most drivers fall into the low-risk category, but there\'s a significant number with medium risk that could be improved with targeted interventions.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverProfiles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Driver Profiles',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sort),
              label: const Text('Sort by Risk'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...drivers.map((driver) => _buildDriverCard(driver)).toList(),
      ],
    );
  }
  
  Widget _buildDriverCard(Map<String, dynamic> driver) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: _getScoreColor(driver['riskScore']).withOpacity(0.2),
                  child: Text(
                    driver['name'].toString().substring(0, 1),
                    style: TextStyle(
                      color: _getScoreColor(driver['riskScore']),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'ID: ${driver['id']} • Last active: ${driver['lastActivity']}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getScoreColor(driver['riskScore']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Risk: ${driver['riskScore']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _getScoreColor(driver['riskScore']),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDriverStatItem(
                    'Accidents',
                    driver['accidents'].toString(),
                    Icons.car_crash,
                    driver['accidents'] > 0 ? Colors.red : Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildDriverStatItem(
                    'Speeding',
                    driver['speedingEvents'].toString(),
                    Icons.speed,
                    driver['speedingEvents'] > 3 ? Colors.orange : Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildDriverStatItem(
                    'Premium',
                    '\$${driver['premium']}',
                    Icons.attach_money,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Details'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDriverStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  
  Color _getScoreColor(double score) {
    if (score >= 90) return Colors.green;
    if (score >= 80) return const Color(0xFF4CAF50);
    if (score >= 70) return Colors.orange;
    if (score >= 60) return Colors.deepOrange;
    return Colors.red;
  }
  
  Widget _buildRecentClaims() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Claims',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildClaimItem(
              'Sarah Johnson',
              'Minor collision',
              'March 22, 2025',
              'Pending Review',
              Colors.orange,
            ),
            const Divider(),
            _buildClaimItem(
              'Robert Wilson',
              'Windshield damage',
              'March 19, 2025',
              'Processing',
              Colors.blue,
            ),
            const Divider(),
            _buildClaimItem(
              'Emma Davis',
              'Theft report',
              'March 15, 2025',
              'Approved',
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildClaimItem(
    String name,
    String description,
    String date,
    String status,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$description • $date',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: statusColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  // Rest of the code remains the same
