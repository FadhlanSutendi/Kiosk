import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              children: [
                const SizedBox(height: 48),
                const Icon(Icons.local_hospital_rounded, color: Colors.white, size: 64),
                const SizedBox(height: 16),
                const Text("MEDIFLOW PRO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2)),
                const SizedBox(height: 48),
                _buildMenuItem(Icons.dashboard_outlined, "Dashboard", true),
                _buildMenuItem(Icons.people_outline, "Patients", false),
                _buildMenuItem(Icons.calendar_today_outlined, "Appointments", false),
                _buildMenuItem(Icons.medical_services_outlined, "Treatments", false),
                _buildMenuItem(Icons.inventory_2_outlined, "Inventory", false),
                _buildMenuItem(Icons.settings_outlined, "Settings", false),
                const Spacer(),
                _buildMenuItem(Icons.logout_rounded, "Logout", false, onTap: () => Get.offAllNamed('/login')),
                const SizedBox(height: 32),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                  child: Row(
                    children: [
                      const Text("Welcome Back, Dr. Admin", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
                      const SizedBox(width: 16),
                      const CircleAvatar(backgroundColor: AppColors.accent, child: Icon(Icons.person, color: Colors.white)),
                    ],
                  ),
                ),
                
                // Dashboard Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildStatCard("Total Patients", "1,280", Icons.people, Colors.blue),
                            const SizedBox(width: 24),
                            _buildStatCard("Active Appointments", "42", Icons.event_available, Colors.green),
                            const SizedBox(width: 24),
                            _buildStatCard("Available Beds", "12/50", Icons.bed_rounded, Colors.orange),
                            const SizedBox(width: 24),
                            _buildStatCard("Pending Reports", "15", Icons.assignment_late_outlined, Colors.red),
                          ],
                        ),
                        const SizedBox(height: 48),
                        Text("Weekly Statistics", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24),
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
                          child: const Center(child: Text("Graphic Overview (Simulated Chart Area)", style: TextStyle(color: Colors.grey))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, bool isActive, {VoidCallback? onTap}) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: isActive ? Colors.white : Colors.white60),
        title: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.white60, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
        tileColor: isActive ? Colors.white.withOpacity(0.1) : null,
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Row(
          children: [
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color, size: 28)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
