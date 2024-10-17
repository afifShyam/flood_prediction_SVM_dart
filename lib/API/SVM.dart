import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

Future<String> getPrediction(String temp, String humd, String rainfall) async {
  try {
    // Load the model from the file.
    final File file = File('svm_model1.pkl');
    final String modelJson = await file.readAsString();

    // Parse the model JSON.
    final Map<String, dynamic> model = json.decode(modelJson);

    // Validate input values.
    final double tempValue = double.tryParse(temp) ?? 0.0;
    final double humdValue = double.tryParse(humd) ?? 0.0;
    final double rainfallValue = double.tryParse(rainfall) ?? 0.0;

    // Create the input query.
    final List<double> inputQuery = [tempValue, humdValue, rainfallValue];

    // Make the prediction.
    final List<dynamic> predictions = model['predict'](inputQuery);
    final double result = predictions.isNotEmpty ? predictions[0] : 0.0;

    return result.toString();
  } catch (error) {
    // Handle exceptions gracefully.
    if (kDebugMode) {
      print('Error in getPrediction: $error');
    }
    return 'Error: Unable to make a prediction';
  }
}

void main() async {
  // Example usage:
  final prediction = await getPrediction('25.0', '60.0', '10.0');
  if (kDebugMode) {
    print('Prediction: $prediction');
  }
}
