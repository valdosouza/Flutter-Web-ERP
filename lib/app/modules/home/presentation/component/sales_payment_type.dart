import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:frontend/app/core/shared/theme.dart';

class SalesPaymentType extends StatelessWidget {
  final String paymentType, svgSrc;
  final String saleValues;

  const SalesPaymentType({
    required this.svgSrc,
    required this.paymentType,
    required this.saleValues,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5), //only(top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: kPrimaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                svgSrc,
                color: kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(paymentType),
          ),
          Expanded(
            flex: 2,
            child: Text(
              saleValues,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
