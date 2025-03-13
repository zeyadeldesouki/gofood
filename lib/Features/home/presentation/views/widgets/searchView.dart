import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
    required SearchController searchController,
    required List<String> suggestions,
  }) : _searchController = searchController,
       _suggestions = suggestions;

  final SearchController _searchController;
  final List<String> _suggestions;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return SearchBar(controller: _searchController, hintText: "Search");
      },
      suggestionsBuilder: (context, controller) {
        return _suggestions
            .map((suggestion) => ListTile(title: Text(suggestion)))
            .toList();
      },
    );
  }
}
