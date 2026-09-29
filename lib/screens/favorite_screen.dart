import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../theme/app_theme.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
    final favoriteActivities = activityProvider.favoriteActivities;

    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: AppBar(
        title: const Text('Aktivitas Favorit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppTheme.primaryBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favoriteActivities.isEmpty
          ? const Center(
        child: Text(
          'Belum ada aktivitas favorit.',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteActivities.length,
        itemBuilder: (context, index) {
          final activity = favoriteActivities[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(activity.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${activity.category} • ${activity.time}'),
              trailing: const Icon(Icons.bookmark, color: AppTheme.primaryBlue),
              onTap: () {
                Navigator.pushNamed(context, '/activity-detail', arguments: activity.id);
              },
            ),
          );
        },
      ),
    );
  }
}