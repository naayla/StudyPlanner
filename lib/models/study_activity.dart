class StudyActivity {
  final String id;
  final String title;
  final String category;
  final String subject;
  final String description; // Atribut deskripsi
  final String date;
  final String time;
  final String status;
  final bool isFavorite;

  StudyActivity({
    required this.id,
    required this.title,
    required this.category,
    this.subject = 'Umum',
    this.description = '',
    this.date = 'Hari Ini',
    required this.time,
    required this.status,
    this.isFavorite = false,
  });
}