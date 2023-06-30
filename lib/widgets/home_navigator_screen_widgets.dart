import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_gaps.dart';

/// A beautiful and animated bottom navigation that paints a rounded shape
///
/// [selectedIndex] is required and must not be null.
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 14,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;

  final double iconSize;

  /// [Theme.bottomAppBarColor] if not provided.
  final Color? backgroundColor;

  final bool showElevation;

  final Duration animationDuration;

  final List<CustomBottomNavigationBarItem> items;

  final ValueChanged<int> onItemSelected;

  /// Defaults to [MainAxisAlignment.spaceBetween].
  final MainAxisAlignment mainAxisAlignment;

  /// The [items] corner radius, if not set, it defaults to 50.
  final double itemCornerRadius;

  final double containerHeight;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          // width: double.infinity,
          height: containerHeight,
          // padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: MainAxisSize.max,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  badgeNumber: item.badgeNumber,
                  width: item.width,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final CustomBottomNavigationBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final double width;
  final Duration animationDuration;
  final int badgeNumber;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    required this.badgeNumber,
    required this.width,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: badgeNumber < 1
          ? AnimatedContainer(
              width: isSelected ? width : 45,
              height: 40,
              duration: animationDuration,
              curve: curve,
              decoration: BoxDecoration(
                color: isSelected ? item.activeColor : backgroundColor,
                borderRadius: BorderRadius.circular(itemCornerRadius),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  height: 40,
                  width: isSelected ? 130 : 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(item.svgAssetIconName,
                          color: isSelected
                              ? Colors.white
                              : item.inactiveColor ?? item.activeColor),
                      if (isSelected) AppGaps.wGap8,
                      if (isSelected)
                        Expanded(
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 4),
                            child: DefaultTextStyle.merge(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              textAlign: item.textAlign,
                              child: Text(item.labelText),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  width: isSelected ? width : 45,
                  height: 40,
                  duration: animationDuration,
                  curve: curve,
                  decoration: BoxDecoration(
                    color: isSelected ? item.activeColor : backgroundColor,
                    borderRadius: BorderRadius.circular(itemCornerRadius),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Container(
                      height: 40,
                      width: isSelected ? 130 : 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(item.svgAssetIconName,
                              color: isSelected
                                  ? Colors.white
                                  : item.inactiveColor ?? item.activeColor),
                          if (isSelected) AppGaps.wGap8,
                          if (isSelected)
                            Expanded(
                              child: Container(
                                // padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: DefaultTextStyle.merge(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  textAlign: item.textAlign,
                                  child: Text(item.labelText),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -10,
                    right: -3,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Text(
                        '${badgeNumber > 99 ? '99+' : badgeNumber}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ))
              ],
            ),
    );
  }
}

/// The [CustomBottomNavigationBar.items] definition.
class CustomBottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    this.badgeNumber = 0,
    this.width = 100,
    required this.svgAssetIconName,
    required this.labelText,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final double width;
  final int badgeNumber;

  final String svgAssetIconName;

  final String labelText;

  /// The [svgAssetIconName] and [labelText] color defined when this item is selected. Defaults
  /// to [AppColors.primaryColor].
  final Color activeColor;

  /// The [svgAssetIconName] and [labelText] color defined when this item is not selected.
  final Color? inactiveColor;

  /// The alignment for the [labelText].
  ///
  final TextAlign? textAlign;
}
