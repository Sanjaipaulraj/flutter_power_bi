import 'package:flutter/material.dart';
import 'draggable_dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarVisible = true;
  double sidebarWidth = 300; // Initial sidebar width like Power BI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Header Bar (Power BI style)
          Container(
            height: 60,
            color: const Color.fromRGBO(247, 179, 215, 1),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Flutter Power BI",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.account_circle, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Main Body (Sidebar + DraggableDashboard)
          Expanded(
            child: Row(
              children: [
                // Main Dashboard Area
                Expanded(
                  child: Container(color: Colors.grey[100], child: const DraggableDashboard()),
                ),

                // Right Sidebar (Filters Pane)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isSidebarVisible ? sidebarWidth : 0,
                  color: Colors.white,
                  child: isSidebarVisible
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 209, 201, 201),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  "Filters Pane",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  children: List.generate(5, (index) {
                                    return Card(
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      // child: ListTile(
                                      //   leading: const Icon(Icons.filter_alt),
                                      //   title: Text("Filter ${index + 1}"),
                                      //   subtitle: const Text("Filter details here"),
                                      // ),
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                                        child: Row(
                                          spacing: 5,
                                          children: [
                                            Icon(Icons.filter_alt),
                                            Column(
                                              spacing: 3,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Filter ${index + 1}",
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                                ),
                                                Text(
                                                  "Filter details here",
                                                  style: TextStyle(fontWeight: FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                ),

                // Toggle Sidebar Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSidebarVisible = !isSidebarVisible;
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 20,
                      color: Colors.grey[300],
                      child: Center(
                        // child: Icon(isSidebarVisible ? Icons.arrow_forward_ios : Icons.arrow_back_ios, size: 16),
                        child: Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(isSidebarVisible ? Icons.arrow_forward_ios : Icons.arrow_back_ios, size: 16),
                            if (isSidebarVisible != true)
                              RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  "Filters",
                                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
