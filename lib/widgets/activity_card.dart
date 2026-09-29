import 'package:flutter/material.dart';
import '../models/study_activity.dart';

class ActivityCard extends StatelessWidget {
  final StudyActivity activity;
  final VoidCallback? onTap;

  const ActivityCard({
    super.key,
    required this.activity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF3E2723);
    const subtitleColor = Color(0xFF5D4037);

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFAF7F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.book_rounded, color: primaryDark),
        ),
        title: Text(
          activity.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryDark,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Kategori: ${activity.category}',
              style: const TextStyle(fontSize: 12, color: subtitleColor),
            ),
            Text(
              'Waktu: ${activity.time}',
              style: const TextStyle(fontSize: 12, color: subtitleColor),
            ),
          ],
        ),
        trailing: Icon(
          activity.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: activity.isFavorite ? Colors.redAccent : Colors.grey,
        ),
      ),
    );
  }
}