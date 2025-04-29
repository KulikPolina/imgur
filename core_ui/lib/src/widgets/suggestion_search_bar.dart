import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core_ui.dart';

class SuggestionSearchBar extends StatefulWidget {
  final List<String> suggestions;
  final List<Widget>? trailing;

  final Widget? leading;

  final ValueChanged<String>? onQueryChanged;
  final ValueChanged<String>? onSuggestionTap;
  final ValueChanged<String>? onSuggestionDelete;

  const SuggestionSearchBar({
    required this.suggestions,
    this.leading,
    this.trailing,
    this.onQueryChanged,
    this.onSuggestionTap,
    this.onSuggestionDelete,
    super.key,
  });

  @override
  State<SuggestionSearchBar> createState() => _SuggestionSearchBarState();
}

class _SuggestionSearchBarState extends State<SuggestionSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  bool _isHideSuggestions = false;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(
      () {
        widget.onQueryChanged?.call(_searchController.text);
        setState(() => _isHideSuggestions = false);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) => setState(() => _isHideSuggestions = true),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.of(context).searchBarColor,
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.of(context).shadowColor,
              offset: const Offset(AppDimens.OFFSET_0, AppDimens.OFFSET_4),
              blurRadius: AppDimens.RADIUS_8,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _searchController,
              style: Theme.of(context).textTheme.titleLarge,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.deny(RegExp(r'\s+')),
              ],
              decoration: InputDecoration(
                icon: widget.leading,
                hintStyle: AppFonts.normal13
                    .copyWith(color: AppColors.of(context).primaryBg),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(AppDimens.BORDER_RADIUS_12),
                    bottom: widget.suggestions.isNotEmpty
                        ? Radius.zero
                        : const Radius.circular(AppDimens.BORDER_RADIUS_12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(AppDimens.BORDER_RADIUS_12),
                    bottom: widget.suggestions.isNotEmpty
                        ? Radius.zero
                        : const Radius.circular(AppDimens.BORDER_RADIUS_12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(AppDimens.BORDER_RADIUS_12),
                    bottom: widget.suggestions.isNotEmpty
                        ? Radius.zero
                        : const Radius.circular(AppDimens.BORDER_RADIUS_12),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(AppDimens.BORDER_RADIUS_12),
                    bottom: widget.suggestions.isNotEmpty
                        ? Radius.zero
                        : const Radius.circular(AppDimens.BORDER_RADIUS_12),
                  ),
                ),
                labelStyle: AppFonts.normal13
                    .copyWith(color: AppColors.of(context).primaryBg),
              ),
            ),
            if (!_isHideSuggestions &&
                widget.suggestions.isNotEmpty) ...<Widget>[
              Divider(color: AppColors.of(context).primaryBg),
              for (final String suggestion in widget.suggestions)
                ListTile(
                  onTap: () {
                    _searchController.text = suggestion;
                    widget.onSuggestionTap?.call(suggestion);
                    setState(() => _isHideSuggestions = true);
                  },
                  title: Text(suggestion),
                  trailing: widget.onSuggestionDelete != null
                      ? IconButton(
                          onPressed: () =>
                              widget.onSuggestionDelete?.call(suggestion),
                          icon: const Icon(Icons.close),
                        )
                      : null,
                ),
            ]
          ],
        ),
      ),
    );
  }
}
