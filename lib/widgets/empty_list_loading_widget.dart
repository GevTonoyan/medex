import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medex/theming/colors.dart';

class EmptyListLoadingWidget extends StatelessWidget {
  final bool isLoading;

  const EmptyListLoadingWidget({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 277,
            width: 371,
            child: Image.asset('assets/empty_list_background.png'),
          ),
          //In Waiting State we need to show loading indicator
          if (isLoading) ...[
            Positioned(
              left: 135,
              top: 76,
              child: SizedBox(
                  height: 81,
                  width: 81,
                  child: SpinKitCircle(
                    color: AppColors.primary,
                    size: 81.0,
                  )),
            )
          ]
        ],
      ),
    );
  }
}
