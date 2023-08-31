import 'package:flutter/material.dart';
import 'package:medex/widgets/app_loading.dart';

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
              child: const AppLoading(),
            )
          ]
        ],
      ),
    );
  }
}
