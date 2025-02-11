import 'package:flutter/material.dart';
import 'package:movie_booking_app/app/utils/colors.dart';

class CustomRatingBar extends StatefulWidget {
  final double initialRating;
  final int itemCount;
  final double itemSize;
  final bool allowHalfRating;
  final ValueChanged<double>? onRatingUpdate;

  const CustomRatingBar({
    super.key,
    this.initialRating = 0.0,
    this.itemCount = 5,
    this.itemSize = 40.0,
    this.allowHalfRating = true,
    this.onRatingUpdate,
  });

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  double _currentRating = 0.0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.itemCount, (index) {
        double rating = index + 1.0;
        double halfRating = rating - 0.5;

        return SizedBox(
          width: widget.itemSize,
          height: widget.itemSize,
          child: Stack(
            children: [
              Icon(Icons.star_border,
                  color: Colors.grey.shade400, size: widget.itemSize),
              if (_currentRating >= rating)
                Icon(Icons.star,
                    color: AppColors.secondaryColor, size: widget.itemSize),
              if (widget.allowHalfRating &&
                  _currentRating >= halfRating &&
                  _currentRating < rating)
                Icon(Icons.star_half,
                    color: AppColors.secondaryColor, size: widget.itemSize),
            ],
          ),
        );
      }),
    );
  }
}
