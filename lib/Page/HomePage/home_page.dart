import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tes_frontend/Model/product_model.dart';
import 'package:tes_frontend/Page/HomePage/HomePageWidget/catridge_search.dart';
import 'package:tes_frontend/Page/HomePage/HomePageWidget/hover_button.dart';
import 'package:tes_frontend/Page/HomePage/HomePageWidget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/dummy_data.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        _products = data.map((item) => Product.fromJson(item)).toList();
      });
    } catch (error) {
      print("Error loading products: $error");
    }
  }

  void _slideLeft() {
    if (_products.isNotEmpty) {
      setState(() {
        _currentIndex =
            (_currentIndex - 1 + _products.length) % _products.length;
      });
    }
  }

  void _slideRight() {
    if (_products.isNotEmpty) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _products.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final padding = isMobile ? 16.0 : 200.0;
    return Scaffold(
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  CartridgeSearch(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "FEATURED PRODUCTS",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Produk
                            Center(
                              child: isMobile
                                  ? Column(
                                      children: [
                                        ProductCard(
                                            product: _products[_currentIndex]),
                                        const SizedBox(height: 10),
                                        if (_products.length > 1)
                                          ProductCard(
                                              product: _products[(_currentIndex + 1) %
                                                  _products.length]),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ProductCard(
                                            product: _products[_currentIndex]),
                                        const SizedBox(width: 10),
                                        if (_products.length > 1)
                                          ProductCard(
                                              product: _products[(_currentIndex + 1) %
                                                  _products.length]),
                                        const SizedBox(width: 10),
                                        if (_products.length > 2)
                                          ProductCard(
                                              product: _products[(_currentIndex + 2) %
                                                  _products.length]),
                                      ],
                                    ),
                            ),
                            if (!isMobile)
                              Positioned(
                                left: 20,
                                child: HoverIconButton(
                                  icon: Icons.arrow_circle_left_outlined,
                                  onTap:
                                      _products.isEmpty ? null : _slideLeft,
                                ),
                              ),
                            if (!isMobile)
                              Positioned(
                                right: 20,
                                child: HoverIconButton(
                                  icon: Icons.arrow_circle_right_outlined,
                                  onTap:
                                      _products.isEmpty ? null : _slideRight,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
