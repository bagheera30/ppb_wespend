import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? sl = 0; // Set the default value to 0
  String bulan = 'juni';
  List<int> angkaList = [0, 1000, 2000, 3000, 4000]; // Include 0 in the list
  int saldo = 10000;

  final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  List<int> riwayatList = [
    1,
    2,
    -1,
    3,
    4,
    -2,
    -3,
    5,
    -4,
  ];
  int visibleRiwayatCount = 5;

  void loadMoreRiwayat() {
    setState(() {
      if (visibleRiwayatCount + 5 <= riwayatList.length) {
        visibleRiwayatCount += 5;
      } else {
        visibleRiwayatCount = riwayatList.length;
      }
    });
  }

  int getRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(9000) +
        1000; // Generate random number between 1000 and 9999
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.yellow[600],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selamat bergabung dengan WeSpend",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(143, 119, 119, 119), // Warna kotak
                    borderRadius:
                        BorderRadius.circular(10), // Melengkungkan sudut kotak
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pengeluaran di bulan $bulan",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white, // Latar belakang putih
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<int>(
                              value: sl,
                              onChanged: (int? newValue) {
                                setState(() {
                                  sl = newValue;
                                });
                              },
                              items: angkaList.map((int angka) {
                                String formattedAngka =
                                    formatCurrency.format(angka);

                                return DropdownMenuItem<int>(
                                  value: angka,
                                  child: Text(formattedAngka,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(143, 119, 119, 119), // Warna kotak
                    borderRadius:
                        BorderRadius.circular(10), // Melengkungkan sudut kotak
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saldo",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white, // Latar belakang putih
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 12),
                            child: Text(formatCurrency.format(saldo),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(143, 119, 119, 119),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Riwayat",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(height: 30),
                        Expanded(
                          child: ListView.builder(
                            itemCount: visibleRiwayatCount,
                            itemBuilder: (context, index) {
                              String pemasukanText = riwayatList[index] > 0
                                  ? 'Pemasukan ${riwayatList[index]}'
                                  : 'Pengeluaran ${riwayatList[index].abs()}';

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    pemasukanText,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          formatCurrency
                                              .format(getRandomNumber()),
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (visibleRiwayatCount < riwayatList.length)
                          TextButton(
                              onPressed: loadMoreRiwayat,
                              child: Text(
                                'Load More',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
