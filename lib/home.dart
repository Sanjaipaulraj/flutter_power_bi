import 'package:flutter/material.dart';
import 'package:flutter_power_bi/data.dart';

class SingleChildScrollViewExampleApp extends StatelessWidget {
  const SingleChildScrollViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SingleChildScrollViewExample());
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color.fromARGB(255, 131, 131, 129),
              width: 600,
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 4,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        "Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        "Qty",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        "Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 236, 236, 148),
              height: 600,
              width: 600,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = data[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 4,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "${item['name']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "${item['qty']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "${item['rate']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
