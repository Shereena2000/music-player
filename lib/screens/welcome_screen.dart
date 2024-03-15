import 'package:flutter/material.dart';
import 'package:mikki_music/screens/home_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    gotoHome();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 0, color:
              const Color.fromARGB(0, 122, 10, 10)
             ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 54, 15, 171),
            Color.fromARGB(255, 75, 27, 162)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'MIKKI MUSIC',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Make Your Life More Live',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomeScreen()),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 20.0, horizontal: 40),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30)),
                //     backgroundColor: Color.fromARGB(210, 44, 2, 51),
                //   ),
                //   child: const Text(
                //     'Get Started',
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                //   ),
                // ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/welcome1.jpg',
                        fit: BoxFit.cover,
                        height: 400 ,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> gotoHome() async {
  await Future.delayed(Duration(seconds: 3));

  Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),
  );
}
}


