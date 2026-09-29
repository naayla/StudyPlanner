import 'package:flutter/material.dart';
import '../models/study_activity.dart';

class ActivityProvider extends ChangeNotifier {
  final List<StudyActivity> _activities = [
    StudyActivity(
      id: 'ACT-001',
      title: 'Belajar Flutter & Dart',
      category: 'Pemrograman Mobile',
      subject: 'Pemrograman Mobile',
      date: '28 Sep 2026',
      time: '09.00 - 11.00 WIB',
      status: 'Sedang Jalan',
      isFavorite: true,
    ),
    StudyActivity(
      id: 'ACT-002',
      title: 'Mengerjakan Tugas Grafika',
      category: 'Grafika Komputer',
      subject: 'Grafika Komputer',
      date: '28 Sep 2026',
      time: '14.00 - 16.00 WIB',
      status: 'Mendatang',
      isFavorite: false,
    ),
    StudyActivity(
      id: 'ACT-003',
      title: 'Review Material Jaringan',
      category: 'Jaringan Komputer',
      subject: 'Jaringan Komputer',
      date: '28 Sep 2026',
      time: '19.30 - 21.00 WIB',
      status: 'Nanti',
      isFavorite: true,
    ),
    StudyActivity(
      id: 'ACT-004',
      title: 'Implementasi REST API Spring Boot',
      category: 'Pemrograman Backend',
      subject: 'Backend Development',
      date: '29 Sep 2026',
      time: '10.00 - 12.00 WIB',
      status: 'Selesai',
      isFavorite: true,
    ),
    StudyActivity(
      id: 'ACT-005',
      title: 'Normalisasi Database PostgreSQL',
      category: 'Basis Data',
      subject: 'Basis Data Lanjut',
      date: '29 Sep 2026',
      time: '13.00 - 15.00 WIB',
      status: 'Mendatang',
      isFavorite: false,
    ),
    StudyActivity(
      id: 'ACT-006',
      title: 'Analisis Kompleksitas Algoritma Dijkstra',
      category: 'Struktur Data & Algoritma',
      subject: 'Struktur Data',
      date: '30 Sep 2026',
      time: '15.30 - 17.30 WIB',
      status: 'Mendatang',
      isFavorite: false,
    ),
    StudyActivity(
      id: 'ACT-007',
      title: 'Desain Wireframe UI/UX Figma',
      category: 'Interaksi Manusia dan Komputer',
      subject: 'IMK',
      date: '30 Sep 2026',
      time: '08.00 - 10.00 WIB',
      status: 'Selesai',
      isFavorite: true,
    ),
    StudyActivity(
      id: 'ACT-008',
      title: 'Simulasi Topologi OSPF Cisco Packet Tracer',
      category: 'Jaringan Komputer',
      subject: 'Jaringan Komputer',
      date: '01 Oct 2026',
      time: '16.00 - 18.00 WIB',
      status: 'Sedang Jalan',
      isFavorite: true,
    ),
    StudyActivity(
      id: 'ACT-009',
      title: 'Latihan Soal Listening & Reading IELTS',
      category: 'Bahasa Inggris',
      subject: 'English for Academic',
      date: '01 Oct 2026',
      time: '20.00 - 21.30 WIB',
      status: 'Nanti',
      isFavorite: false,
    ),
    StudyActivity(
      id: 'ACT-010',
      title: 'Debugging State Management Provider',
      category: 'Pemrograman Mobile',
      subject: 'Pemrograman Mobile',
      date: '02 Oct 2026',
      time: '22.00 - 23.00 WIB',
      status: 'Nanti',
      isFavorite: false,
    ),
  ];

  List<StudyActivity> get activities => _activities;

  List<StudyActivity> get favoriteActivities =>
      _activities.where((activity) => activity.isFavorite).toList();

  StudyActivity? findById(String id) {
    try {
      return _activities.firstWhere((activity) => activity.id == id);
    } catch (e) {
      return null;
    }
  }

  void addActivity(StudyActivity activity) {
    _activities.add(activity);
    notifyListeners();
  }

  void updateActivity(StudyActivity updatedActivity) {
    final index = _activities.indexWhere((a) => a.id == updatedActivity.id);
    if (index != -1) {
      _activities[index] = updatedActivity;
      notifyListeners();
    }
  }

  void deleteActivity(String id) {
    _activities.removeWhere((activity) => activity.id == id);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      final current = _activities[index];
      _activities[index] = StudyActivity(
        id: current.id,
        title: current.title,
        category: current.category,
        subject: current.subject,
        date: current.date,
        time: current.time,
        status: current.status,
        isFavorite: !current.isFavorite,
      );
      notifyListeners();
    }
  }
}