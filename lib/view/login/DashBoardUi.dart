import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoardPage(),
    );
  }
}

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 5),
                Text(
                  'West Godavari, A.P',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.tune, color: Colors.green),
                ],
              ),
              const SizedBox(height: 20),

              // Most Searched Farmland
              Container(
                height: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                          child: Image.network(
                            'https://via.placeholder.com/300', // Replace with farmland image URL
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Most Searched Farmland",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("GLCSOS 01"),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("View Details"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recommended Farmlands
              SectionHeader(title: "Recommended Farmlands"),
              NoDataPlaceholder(),

              // Trending Locations
              SectionHeader(title: "Trending Locations", actionText: "View All"),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  TrendingLocationCard(name: "Tanuku", lands: 384),
                  TrendingLocationCard(name: "Bhimavaram", lands: 256),
                  TrendingLocationCard(name: "Marteru", lands: 349),
                  TrendingLocationCard(name: "Palakollu", lands: 113),
                  TrendingLocationCard(name: "Rajamundry", lands: 69),
                  TrendingLocationCard(name: "Penugonda", lands: 108),
                ],
              ),
              const SizedBox(height: 20),

              // Latest Farmlands
              SectionHeader(title: "Latest Farmlands", actionText: "View All"),
              NoDataPlaceholder(),

              // Ready to Get Started Section
              Card(
                color: Colors.green[50],
                child: ListTile(
                  title: Text("Ready to get started?"),
                  subtitle: Text("Let's help you to begin investing"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Get Started"),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recent Comparison
              SectionHeader(title: "Recent Comparison"),
              NoDataPlaceholder(),
            ],
          ),
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

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;

  SectionHeader({required this.title, this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        if (actionText != null)
          TextButton(
            onPressed: () {},
            child: Text(actionText!, style: TextStyle(color: Colors.green)),
          ),
      ],
    );
  }
}

class TrendingLocationCard extends StatelessWidget {
  final String name;
  final int lands;

  TrendingLocationCard({required this.name, required this.lands});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.place, color: Colors.green),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("$lands Lands"),
        ],
      ),
    );
  }
}

class NoDataPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/no_data.png', // Add a no data placeholder image
            height: 350,
          ),
        ],
      ),
    );
  }
}
