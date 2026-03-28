import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_curved_edges.dart';

class TCustomCurvedWidget extends StatelessWidget {
  const TCustomCurvedWidget({
    super.key, this.child,
  });
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child:child
    );
  }
}

