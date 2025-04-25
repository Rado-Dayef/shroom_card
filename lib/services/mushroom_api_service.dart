import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MushroomApiService {
  // Hugging Face API endpoint for mushroom identification
  static const String apiUrl = 'https://api-inference.huggingface.co/models/provac/mushrooms';
  
  // Method to identify mushroom from image file
  static Future<Map<String, dynamic>> identifyMushroom(File imageFile) async {
    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      
      // Get file extension for content type
      String fileExtension = imageFile.path.split('.').last.toLowerCase();
      String contentType = 'image/jpeg'; // Default to jpeg
      
      if (fileExtension == 'png') {
        contentType = 'image/png';
      } else if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
        contentType = 'image/jpeg';
      }
      
      // Add the image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          contentType: MediaType.parse(contentType),
        ),
      );
      
      // Send the request
      var response = await request.send();
      
      // Get response
      var responseData = await response.stream.bytesToString();
      
      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse and return the response
        return json.decode(responseData);
      } else {
        // Return error information
        return {
          'error': true,
          'message': 'Failed to identify mushroom. Status code: ${response.statusCode}',
          'details': responseData
        };
      }
    } catch (e) {
      // Return error information
      return {
        'error': true,
        'message': 'Error identifying mushroom',
        'details': e.toString()
      };
    }
  }
}