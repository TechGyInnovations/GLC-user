import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmlandListingPage(),
    );
  }
}

class FarmlandListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.green),
            const SizedBox(width: 5),
            Text(
              'West Godavari, A.P',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "33 Farmlands Listing",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  FarmlandCard(
                    tag: "New",
                    imageUrl: "https://via.placeholder.com/300",
                    title: "GLCSOS 01",
                    location: "Tanuku, West Godavari, AP",
                    crops: ["Corn", "Potato"],
                    investment: 100000.00,
                  ),
                  FarmlandCard(
                    tag: "Trending",
                    imageUrl: "https://via.placeholder.com/300",
                    title: "GLCSOS 02",
                    location: "Tanuku, West Godavari, AP",
                    crops: ["Cotton", "Rice"],
                    investment: 400000.00,
                  ),
                  FarmlandCard(
                    tag: "Certified By GLC",
                    imageUrl: "https://via.placeholder.com/300",
                    title: "GLCSOS 03",
                    location: "Vijayawada, Krishna, AP",
                    crops: ["Wheat", "Potato"],
                    investment: 600000.00,
                  ),
                  FarmlandCard(
                    tag: "New",
                    imageUrl: "https://via.placeholder.com/300",
                    title: "GLCSOS 04",
                    location: "Tanuku, West Godavari, AP",
                    crops: ["Wheat", "Potato"],
                    investment: 200000.00,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: "Farmlands"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "My Purchases"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class FarmlandCard extends StatelessWidget {
  final String tag;
  final String imageUrl;
  final String title;
  final String location;
  final List<String> crops;
  final double investment;

  FarmlandCard({
    required this.tag,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.crops,
    required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Row(
                  children: crops.map((crop) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        crop,
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Text(
                  "Min. Investment",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Rs. ${investment.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  child: Center(child:
                  Text("View Details",style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
