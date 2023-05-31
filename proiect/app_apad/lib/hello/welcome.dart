import 'package:flutter/material.dart';
import 'package:app_apad/pages/homepage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 30, fontFamily: 'CormorantGaramond-Bold'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "This is an application where you can write down your thoughts",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'CormorantGaramond-Medium'),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Text("Go to your notes"))
          ],
        ),
      ),
    );
  }
}
