import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({
    Key? key,
    required this.message,
    required this.onRetryPressed,
  }) : super(key: key);

  final String message;
  final VoidCallback onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.warning,
            size: 50,
          ),
          Text(message),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
