import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tes_frontend/Page/HomePage/HomePageWidget/painter.dart';

class CartridgeSearch extends StatefulWidget {
  const CartridgeSearch({super.key});

  @override
  _CartridgeSearchState createState() => _CartridgeSearchState();
}

class _CartridgeSearchState extends State<CartridgeSearch> {
  List<String> printerBrands = [];
  List<String> printerSeries = [];
  List<String> printerModels = [];

  String? selectedBrand;
  String? selectedSeries;
  String? selectedModel;

  int _selectedIndex = 0;

  final List<String> _tabItems = [
    '3-Step Easy Search®',
    'Search by Serial Number'
  ];

  @override
  void initState() {
    super.initState();
    _loadDropdownData();
  }

  Future<void> _loadDropdownData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/dummy_data_dropdown.json');
      final Map<String, dynamic> data = json.decode(response);
      setState(() {
        printerBrands = List<String>.from(data['printerBrands']);
        printerSeries = List<String>.from(data['printerSeries']);
        printerModels = List<String>.from(data['printerModels']);
      });
    } catch (e) {
      print("Error loading dropdown data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: _buildBackgroundDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 20),
              _buildSearchContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: const AssetImage('assets/images/cmyk.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.3),
          BlendMode.darken,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

 Widget _buildSearchContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 200),
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25), // Memberi jarak untuk tab di atas
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25), // Ruang kosong untuk tab
              _selectedIndex == 0
                  ? _buildSearchFields(context)
                  : _buildSerialNumberSearch(context),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildTabs(), // Tab berada di atas container
        ),
      ],
    ),
  );
}

Widget _buildTabs() {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200], // Background untuk semua tab
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
        ),
        child: Row(
          children: List.generate(_tabItems.length, (index) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  color: _selectedIndex == index ? Colors.blue : Colors.transparent,
                  child: Text(
                    _tabItems[index],
                    style: TextStyle(
                      color: _selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      Positioned(
        bottom: 0,
        left: _selectedIndex == 0
            ? 0
            : MediaQuery.of(context).size.width / _tabItems.length * _selectedIndex,
        child: CustomPaint(
          size: const Size(20, 10), // Ukuran segitiga
          painter: TrianglePainter(color: Colors.blue),
        ),
      ),
    ],
  );
}

  Widget _buildSearchFields(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedBrand,
            items: printerBrands
                .map((brand) =>
                    DropdownMenuItem(value: brand, child: Text(brand)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedBrand = value;
              });
            },
            decoration: const InputDecoration(
              labelText: '1. Printer Brand',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedSeries,
            items: printerSeries
                .map((series) =>
                    DropdownMenuItem(value: series, child: Text(series)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSeries = value;
              });
            },
            decoration: const InputDecoration(
              labelText: '2. Printer Series',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedModel,
            items: printerModels
                .map((model) =>
                    DropdownMenuItem(value: model, child: Text(model)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedModel = value;
              });
            },
            decoration: const InputDecoration(
              labelText: '3. Printer Model',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 19),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              print(
                  'Brand: $selectedBrand, Series: $selectedSeries, Model: $selectedModel');
            },
            child: const Text(
              'FIND CARTRIDGES',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSerialNumberSearch(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Serial Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
