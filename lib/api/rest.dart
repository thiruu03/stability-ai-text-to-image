import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stability_ai/screens/second_screen.dart';
import 'package:stability_ai/utils/dialog.dart';

Future<dynamic> convertTextToImage(
  String prompt,
  BuildContext context,
) async {
  Uint8List imageData = Uint8List(0);

  const baseUrl = 'https://api.stability.ai';
  final url = Uri.parse('$baseUrl/v2beta/stable-image/generate/sd3');

  var request = http.MultipartRequest('POST', url);
  request.fields['prompt'] = prompt;
  request.fields['mode'] = 'text-to-image';
  request.fields['aspect_ratio'] = '1:1';
  request.fields['model'] = 'sd3-large';
  request.fields['samples'] = '1';
  request.fields['seed'] = '0';
  request.fields['output_format'] = 'png';

  request.headers.addAll({
    'Authorization':
        'Bearer YOUR_API_KEY',
    'Accept': 'image/*',
  });

  var response = await request.send();

  if (response.statusCode == 200) {
    try {
      final responseBytes = await response.stream.toBytes();
      imageData = Uint8List.fromList(responseBytes);
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(image: imageData),
          ),
        );
      }
      return imageData;
    } catch (e) {
      return showErrorDialog('Failed to generate image', context);
    }
  } else {
    final responseBody = await response.stream.bytesToString();
    print('Error status code: ${response.statusCode}');
    print('Error response body: $responseBody');
    return showErrorDialog('Failed to generate image', context);
  }
}
