import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/study_activity.dart';
import '../providers/activity_provider.dart';
import '../theme/app_theme.dart';

class AddEditScreen extends StatefulWidget {
  final StudyActivity? activityToEdit;

  const AddEditScreen({super.key, this.activityToEdit});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _subject;
  late String _category;
  late String _date;
  late String _time;
  late String _description;
  late String _status;

  @override
  void initState() {
    super.initState();
    final act = widget.activityToEdit;
    _title = act?.title ?? '';
    _subject = act?.subject ?? '';
    _category = act?.category ?? 'Pemrograman Mobile';
    _date = act?.date ?? '28 Sep 2026';
    _time = act?.time ?? '09.00 - 11.00 WIB';
    _description = act?.description ?? '';
    _status = act?.status ?? 'Sedang Jalan';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.activityToEdit != null;

    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Aktivitas' : 'Tambah Aktivitas Baru',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primaryBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Judul Aktivitas',
                initialValue: _title,
                hint: 'Contoh: Belajar Flutter & Dart',
                onSaved: (val) => _title = val ?? '',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Mata Kuliah / Topik',
                initialValue: _subject,
                hint: 'Contoh: Pemrograman Mobile',
                onSaved: (val) => _subject = val ?? '',
              ),
              const SizedBox(height: 16),
              _buildDropdownField(
                label: 'Kategori',
                value: _category,
                items: ['Pemrograman Mobile', 'Jaringan Komputer', 'Basis Data', 'Keamanan Jaringan', 'Lainnya'],
                onChanged: (val) => setState(() => _category = val!),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Tanggal',
                      initialValue: _date,
                      hint: '28 Sep 2026',
                      onSaved: (val) => _date = val ?? '',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: 'Waktu',
                      initialValue: _time,
                      hint: '09.00 - 11.00 WIB',
                      onSaved: (val) => _time = val ?? '',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDropdownField(
                label: 'Status',
                value: _status,
                items: ['Sedang Jalan', 'Mendatang', 'Selesai'],
                onChanged: (val) => setState(() => _status = val!),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Deskripsi Tambahan',
                initialValue: _description,
                hint: 'Masukkan keterangan atau catatan...',
                maxLines: 3,
                onSaved: (val) => _description = val ?? '',
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final provider = Provider.of<ActivityProvider>(context, listen: false);

                      if (isEditing) {
                        final updatedActivity = StudyActivity(
                          id: widget.activityToEdit!.id,
                          title: _title,
                          subject: _subject,
                          category: _category,
                          date: _date,
                          time: _time,
                          description: _description,
                          status: _status,
                          isFavorite: widget.activityToEdit!.isFavorite,
                        );
                        provider.updateActivity(updatedActivity);
                      } else {
                        final newActivity = StudyActivity(
                          id: 'ACT-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                          title: _title,
                          subject: _subject,
                          category: _category,
                          date: _date,
                          time: _time,
                          description: _description,
                          status: _status,
                          isFavorite: false,
                        );
                        provider.addActivity(newActivity);
                      }

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(isEditing ? 'Aktivitas berhasil diperbarui!' : 'Aktivitas berhasil ditambahkan!')),
                      );
                    }
                  },
                  child: Text(
                    isEditing ? 'Simpan Perubahan' : 'Tambah Aktivitas',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required String hint,
    int maxLines = 1,
    required FormFieldSetter<String> onSaved,
  } ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.darkBlue),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
            ),
          ),
          validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
          onSaved: onSaved,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.darkBlue),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}