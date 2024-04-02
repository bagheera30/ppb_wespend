import 'package:flutter/material.dart';

class AddExpendesPage extends StatefulWidget {
  const AddExpendesPage({super.key});

  @override
  State<AddExpendesPage> createState() => _AddExpendesPageState();
}

class _AddExpendesPageState extends State<AddExpendesPage> {
  String _selectedCategory = '';

  void _showSavedData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Latar belakang warna kuning
          title: Text('Data Tersimpan'),
          content: Text('Data Expends telah disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Add Expends',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.yellow[600], // Menghilangkan tombol panah kiri
      ),
      body: SafeArea(
        child: Container(
          color: Colors.yellow[600],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Expends',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Pilih Kategori',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedCategory = 'foot';
                            });
                          },
                          icon: Icon(Icons.fastfood_rounded),
                          color: _selectedCategory == 'foot'
                              ? Colors.green
                              : Colors.grey,
                        ),
                        Text('Primary'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedCategory = 'belanja';
                            });
                          },
                          icon: Icon(Icons.shopping_cart),
                          color: _selectedCategory == 'belanja'
                              ? Colors.green
                              : Colors.grey,
                        ),
                        Text('secondary'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedCategory = 'tagihan';
                            });
                          },
                          icon: Icon(Icons.receipt),
                          color: _selectedCategory == 'tagihan'
                              ? Colors.green
                              : Colors.grey,
                        ),
                        Text(
                          'Tertiery',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showSavedData();
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
