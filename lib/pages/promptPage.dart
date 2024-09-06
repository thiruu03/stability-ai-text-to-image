import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stability_ai/api/rest.dart';

class Promptpage extends StatefulWidget {
  const Promptpage({super.key});

  @override
  State<Promptpage> createState() => _PromptpageState();
}

class _PromptpageState extends State<Promptpage> {
  final textController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: const Text(
          "Generate Images 🚀",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: Lottie.asset('assets/animations/load.json'),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter the prompt here : ",
                    style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () {
                        convertTextToImage(textController.text, context);
                        isLoading = true;

                        setState(() {});
                      },
                      label: const Text(
                        "Generate",
                        style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      icon: const Icon(Icons.generating_tokens),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
