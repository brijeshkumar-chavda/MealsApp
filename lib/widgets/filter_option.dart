import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.currentActiveFilter,
    required this.onChanged,
    required this.title,
    required this.subTitle,
  });

  final bool currentActiveFilter;
  final void Function(bool) onChanged;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: currentActiveFilter,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
