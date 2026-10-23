import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Pendaftaran Wali Nagari',
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController nim = TextEditingController();
  final TextEditingController nama = TextEditingController();

  List<Map<String, dynamic>> ListData = [
    {'nim': '24101152630008', 'nama': 'Belvana'},
    {'nim': '24101152630005', 'nama': 'John Doe'},
    {'nim': '24101152630006', 'nama': 'Jane Smith'},
  ];

  void tampilkanText() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(nama.text),
          content: Text('nobp mahasiswa : ${nim.text} '),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pendaftaran Wali Nagari'),
        backgroundColor: const Color.fromARGB(255, 33, 243, 79),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              Text("Form Input Wali Nagari", style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: nim,
                decoration: InputDecoration(
                  labelText: 'NIM Mahasiswa',
                  hintText: 'Input NIM Mahasiswa',
                  icon: Icon(Icons.account_box_rounded),
                ),
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  labelText: 'Nama Mahasiswa',
                  hintText: 'Input Nama Mahasiswa',
                  icon: Icon(Icons.people_alt_rounded),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 243, 79),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  tampilkanText();
                },
                label: Text('Simpan'),
                icon: Icon(Icons.save_rounded),
              ),
              SizedBox(height: 20),
              Divider(),
              Text('List Data'),
              Expanded(
                child: ListView.builder(
                  itemCount: ListData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(ListData[index]['nama']),
                        subtitle: Text(ListData[index]['nim']),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
