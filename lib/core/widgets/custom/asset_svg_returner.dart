import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetSvg extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;

  const AssetSvg({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
     
    if(asset.endsWith('.png') || asset.endsWith('.jpg') || asset.endsWith('.jpeg')){
    return  Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    );

    }
    
   return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
      alignment: alignment,
    );
  }
}
