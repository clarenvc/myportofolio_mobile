import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _schoolName = "";
  String _startYear = "";
  String _endYear = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Education Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === 1. Nama Institusi ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi / Sekolah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _schoolName = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Nama institusi minimal terdiri dari 3 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === 2. Tahun Mulai ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Contoh: 2025",
                    labelText: "Tahun Mulai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _startYear = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tahun mulai tidak boleh kosong!";
                    }
                    final parsedYear = int.tryParse(value.trim());
                    if (parsedYear == null || value.trim().length != 4) {
                      return "Tahun mulai harus berupa 4 digit angka!";
                    }
                    if (parsedYear < 1950 || parsedYear > 2100) {
                      return "Masukkan tahun mulai yang valid (1950–2100)!";
                    }
                    return null;
                  },
                ),
              ),

              // === 3. Tahun Selesai ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 2029 atau Present",
                    labelText: "Tahun Selesai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _endYear = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tahun selesai tidak boleh kosong!";
                    }
                    final trimmed = value.trim();
                    if (trimmed.toLowerCase() == "present") {
                      return null;
                    }
                    final parsedEnd = int.tryParse(trimmed);
                    if (parsedEnd == null || trimmed.length != 4) {
                      return "Isi dengan 4 digit tahun atau 'Present'!";
                    }
                    final parsedStart = int.tryParse(_startYear.trim());
                    if (parsedStart != null && parsedEnd < parsedStart) {
                      return "Tahun selesai tidak boleh lebih kecil dari tahun mulai!";
                    }
                    return null;
                  },
                ),
              ),

              // === 4. Deskripsi ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Contoh: S1 Ilmu Komputer - Fokus Rekayasa Perangkat Lunak",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal terdiri dari 10 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 16.0),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Edukasi berhasil ditambahkan!'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Nama Institusi: ${_schoolName.trim()}'),
                                  Text('Tahun Mulai: ${_startYear.trim()}'),
                                  Text('Tahun Selesai: ${_endYear.trim()}'),
                                  Text('Deskripsi: ${_description.trim()}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Tutup'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _schoolName = "";
                                    _startYear = "";
                                    _endYear = "";
                                    _description = "";
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
