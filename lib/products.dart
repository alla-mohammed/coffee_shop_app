import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List<Map<String, String>> coffeeProducts = [
    {"title": "Espresso", "image": "assets/espresso.jpg"},
    {"title": "Cappuccino", "image": "assets/cappuccino.jpg"},
    {"title": "Latte", "image": "assets/latte.jpg"},
    {"title": "Mocha", "image": "assets/mocha.jpg"},
    {"title": "Americano", "image": "assets/americano.jpg"},
    {"title": "Macchiato", "image": "assets/macchiato.jpg"},
  ];

  PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    "assets/coffe_home1.jpg",
    "assets/coffe_home2.jpg",
    "assets/coffe_home3.jpg",
  ];

  void nextPage() {
    if (_currentPage < images.length - 1) {
      _controller.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _controller.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E342E),
        title: Text(
          "ourProducts",
          style: const TextStyle(
            fontFamily: "Suwannaphum",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
            child: Text(
              context.locale.languageCode == 'en' ? "AR" : "EN",
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 244, 244),
          ),
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Text(
                "featuredProducts".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.3,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          images[index],
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                '${_currentPage + 1} / ${images.length}',
                style: TextStyle(
                    fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: previousPage,
                    icon: const Icon(Icons.arrow_back),
                    color: const Color(0xFF4E342E),
                    iconSize: screenWidth * 0.08,
                  ),
                  IconButton(
                    onPressed: nextPage,
                    icon: const Icon(Icons.arrow_forward),
                    color: const Color(0xFF4E342E),
                    iconSize: screenWidth * 0.08,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "shopOurCollection".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: coffeeProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 3 : 2,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.01,
                    childAspectRatio: screenWidth > 600 ? 0.8 : 0.90,
                  ),
                  itemBuilder: (context, index) {
                    final product = coffeeProducts[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              product["image"]!,
                              height: screenHeight * 0.22,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            product["title"]!,
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            color: const Color(0xFF4E342E),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${product["title"]} added to the cart'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "hotOffers".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.07,
                ),
              ),
              SizedBox(
                height: 400, 
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final offerDescriptions = [
                      "Espresso Special: Strong, bold, and full of flavor.",
                      "Cappuccino Delight: Creamy froth with rich coffee taste.",
                      "Latte Love: Smooth milk blended perfectly with espresso.",
                      "Mocha Magic: Chocolate and coffee in a heavenly mix.",
                      "Americano Classic: Light, refreshing, and perfectly brewed.",
                    ];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              "assets/offer${index + 1}.jpg",
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                offerDescriptions[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
