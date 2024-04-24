import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LimitPage extends StatefulWidget {
  const LimitPage({Key? key});

  @override
  State<LimitPage> createState() => _LimitPageState();
}

class _LimitPageState extends State<LimitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0,
        centerTitle: true,
        leading: Container(), // Menghilangkan tombol kembali
        title: Text('Limit pengeluaran',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
      body: Container(
        color: Colors.yellow[600],
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Silakan masukkan limit yang Anda inginkan:',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Limit pengeluaran',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
