import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.labelMedium,
          children: [
            const TextSpan(
              text:
                  'By connecting your account confirm that you agree\nwith our ',
            ),
            TextSpan(
              text: 'Term and Condition',
              style: Theme.of(context).textTheme.titleSmall,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: Navigate to terms
                },
            ),
          ],
        ),
      ),
    );
  }
}
