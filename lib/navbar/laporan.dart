import 'package:flutter/material.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({Key? key}) : super(key: key);

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  String? selectedBulan;
  String? selectedTahun;

  List<String> bulanList = ['Januari', 'Februari', 'Maret', 'April', 'Mei'];
  List<String> tahunList = ['2022', '2023', '2024', '2025', '2026'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0,
        centerTitle: true,
        leading: Container(),
        title: const Text(
          'Laporan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow[600],
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Pilih bulan dan tahun untuk melihat laporan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedBulan,
                    decoration: InputDecoration(
                      labelText: 'Bulan',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBulan = newValue;
                      });
                    },
                    items: bulanList.map((String bulan) {
                      return DropdownMenuItem<String>(
                        value: bulan,
                        child: Text(
                          bulan,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedTahun,
                    decoration: InputDecoration(
                      labelText: 'Tahun',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTahun = newValue;
                      });
                    },
                    items: tahunList.map((String tahun) {
                      return DropdownMenuItem<String>(
                        value: tahun,
                        child: Text(
                          tahun,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your logic to fetch or display data based on selected month and year
                print('Bulan: $selectedBulan, Tahun: $selectedTahun');
              },
              child: const Text('Tampilkan Data'),
            ),
          ],
        ),
      ),
    );
  }
}
