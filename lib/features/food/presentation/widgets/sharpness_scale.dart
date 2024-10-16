import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peak_it_2024_app/core/utils/icon_paths.dart';

class SharpnessScale extends StatelessWidget {
  const SharpnessScale({
    super.key,
    required this.sharpness,
  });

  final int sharpness;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          sharpness,
          (index) => SvgPicture.asset(
                IconPaths.flame,
                height: 14,
                width: 14,
                colorFilter: ColorFilter.mode(
                    sharpness == 1
                        ? const Color(0xFFFAC20C)
                        : sharpness == 2
                            ? Colors.orange
                            : Colors.red,
                    BlendMode.srcIn),
              )),
    );
  }
}
