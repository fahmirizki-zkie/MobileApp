import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Text(
                'Welcome Back 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MENU ROW  
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    const Text('Profile'),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: const Icon(Icons.settings, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    const Text('Settings'),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.orange,
                      child: const Icon(Icons.logout, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    const Text('Logout'),
                  ],
                ),

              ],
            ),

            const SizedBox(height: 20),

            // STACK SIMPLE
            Stack(
              children: [

                Container(
                  height: 120,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 75, 168, 226),
                ),

                const Positioned(
                  top: 45,
                  left: 120,
                  child: Text(
                    'Promo Hari Ini',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            // GRID BASIC (pakai Row saja)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: 100,
                  height: 80,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Container(
                  width: 100,
                  height: 80,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Item 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: 100,
                  height: 80,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Item 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Container(
                  width: 100,
                  height: 80,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Item 4',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}