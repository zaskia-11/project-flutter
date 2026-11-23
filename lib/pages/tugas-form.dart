import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_zaskia/helpers/size_helper.dart';
import 'package:project_zaskia/pages/output-eskul.dart';


class TugasForm extends StatefulWidget {
  const new({super.key});

  @override
  State<TugasForm> createState() => _TugasFormState();
}

class _TugasFormState extends State<TugasForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();  
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglDaftarController = TextEditingController();

  String _pilihKelas = '';

  final List<String> kelas = [
    'X',
    'XI',
    'XII',
  ];
  Map<String, bool> pilihanEskul = {
    "Musik kolaborasi": false,
    "paskibra": false,
    "pmr": false,
    "jurnalistik": false,
    "sains": false,
    "futsL": false,
  };
  String? _eskulError;

  @override
  void initState() {
    tglDaftarController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Form Biodata",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nama' ;
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: telpController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'No Telepon',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input No Telepon' ;
                          return null;
                        },
                      ),   
                       const SizedBox(height: 18),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Email' ;
                          return null;
                        },
                      ),    
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Pilih Kelas',
                          border: OutlineInputBorder(),
                        ),
                        items: kelas
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text (item), 
                          ),
                        )
                        .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihKelas = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Kelas';
                          }
                          return null;
                        },
                      ),                    
                        const Text(
                          "Pilih Eskul (Minimal 1, Maksimal 2):",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        ...pilihanEskul.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: pilihanEskul[key],
                            onChanged: (bool? value) {
                              setState(() {
                                int totalSelected = pilihanEskul.values
                                    .where((selected) => selected)
                                    .length;

                                if (value == true && totalSelected >= 2) {
                                  _eskulError = 'Maksimal hanya boleh memilih 2 eskul';
                                  return;
                                }

                                pilihanEskul[key] = value!;
                                
                                int currentTotal = pilihanEskul.values
                                    .where((selected) => selected)
                                    .length;
                                if (currentTotal > 0 && currentTotal <= 2) {
                                  _eskulError = null;
                                }
                              });
                            },
                          );
                        }).toList(),

                        if (_eskulError != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                            child: Text(
                              _eskulError!,
                              style: const TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),

                      const SizedBox(height: 18),
                      //agama
                      TextFormField(
                        controller: tglDaftarController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Daftar',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Tanggal Daftar' ;
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              tglDaftarController.text = DateFormat(
                                'yyyy-MM-dd'
                              ).format(pickedDate); 
                            });
                          }
                        },
                      ),
                      
                      const SizedBox(height: 24),
                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white)
                          ),
                          onPressed: _submit,
                          ),
                        ),                                            
                      ],
                    ),
                  ),
                )
              ),
            ),      
          ),
        ),
      );
    }
      void _submit() {
      final isValid = _formKey.currentState!.validate();
      
      int totalEskulSelected =
          pilihanEskul.values.where((selected) => selected).length;

      if (totalEskulSelected == 0) {
        setState(() {
          _eskulError = 'Pilih minimal 1 ekstrakurikuler';
        });
        return;
      } else if (totalEskulSelected > 2) {
        setState(() {
          _eskulError = 'Maksimal hanya boleh memilih 2 ekstrakurikuler';
        });
        return;
      }

      if (!isValid) return;

      List<String> eskulTerpilih = pilihanEskul.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      // Berpindah ke halaman OutputEskulScreen yang ada di output2.dart
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputEskulScreen(            
            nama: namaController.text,
            telp: telpController.text,
            email: emailController.text,
            kelas: _pilihKelas!,
            eskul: eskulTerpilih,
            tglDaftar: tglDaftarController.text,              
          ),
            ),
          );
        }
 }