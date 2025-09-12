import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                ),
                SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Profile Sections
          _buildSection(
            title: 'My Listings',
            icon: Icons.home,
            onTap: () {},
          ),
          _buildSection(
            title: 'Viewing Appointments',
            icon: Icons.calendar_today,
            onTap: () {},
          ),
          _buildSection(
            title: 'Notifications',
            icon: Icons.notifications,
            onTap: () {},
          ),
          _buildSection(
            title: 'Payment Methods',
            icon: Icons.payment,
            onTap: () {},
          ),
          _buildSection(
            title: 'Help & Support',
            icon: Icons.help,
            onTap: () {},
          ),
          _buildSection(
            title: 'About Us',
            icon: Icons.info,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          
          // Logout Button
          OutlinedButton.icon(
            onPressed: () {
              // TODO: Implement logout
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}