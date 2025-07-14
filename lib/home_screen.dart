import 'package:flutter/material.dart';
import 'draggable_dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarVisible = true;
  double sidebarWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
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

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.grey[100], child: const DraggableDashboard()),
                ),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isSidebarVisible ? sidebarWidth : 0,
                  color: Colors.white,
                  child: (isSidebarVisible && sidebarWidth > 100)
                      ? LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 100) {
                              return const SizedBox();
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  color: const Color.fromARGB(255, 61, 54, 54),
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
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.filter_alt),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Text(
                                                        "Filter title",
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      Text(
                                                        "Filter details here",
                                                        style: TextStyle(fontWeight: FontWeight.normal),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ],
                                                  ),
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
                            );
                          },
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
                      width: 40,
                      color: Colors.grey[300],
                      child: Center(
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
