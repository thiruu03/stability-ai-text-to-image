import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stability_ai/pages/promptPage.dart';

class SecondScreen extends StatefulWidget {
  final Uint8List image;
  const SecondScreen({super.key, required this.image});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.memory(
              widget.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                    iconSize: 40, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Promptpage(),
                    ),
                  );
                },
                icon: const Icon(Icons.home),
              ),
              IconButton(
                style: IconButton.styleFrom(
                    iconSize: 40, foregroundColor: Colors.white),
                onPressed: () {},
                icon: const Icon(Icons.download),
              ),
              IconButton(
                style: IconButton.styleFrom(
                    iconSize: 40, foregroundColor: Colors.white),
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
