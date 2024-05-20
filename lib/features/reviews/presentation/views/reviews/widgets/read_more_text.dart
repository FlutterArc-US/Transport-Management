import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final TextStyle readMoreStyle;
  final int trimLength;

  const ReadMoreText({
    required this.text,
    required this.textStyle,
    required this.readMoreStyle,
    super.key,
    this.trimLength = 100,
  });

  @override
  State createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final textStyle = widget.textStyle;
    final readMoreStyle = widget.readMoreStyle;
    final trimLength = widget.trimLength;

    return RichText(
      text: TextSpan(
        text: isExpanded || text.length <= trimLength
            ? text
            : text.substring(0, trimLength),
        style: textStyle,
        children: <TextSpan>[
          if (text.length > trimLength)
            TextSpan(
              text: isExpanded ? ' Show less' : '... Read more',
              style: readMoreStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
        ],
      ),
    );
  }
}
