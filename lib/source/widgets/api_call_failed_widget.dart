import 'package:flutter/material.dart';

class ApiCallFailedWidget extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const ApiCallFailedWidget({super.key, required this.message, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: onTryAgain,
          child: const Text('Tentar novamente'),
        )
      ],
    );
  }
}
