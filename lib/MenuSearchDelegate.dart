import 'package:flutter/material.dart';
import 'package:product_listtt/data/menu.dart';

class MenuSearchDelegate extends SearchDelegate<String> {
  final List<Menu> menuList;
  bool isSearching = false;

  MenuSearchDelegate(this.menuList);

  @override
  String get searchFieldLabel => 'Search Menu';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      isSearching
          ? IconButton(
              onPressed: () {
                query = '';
                isSearching = false; // Keluar dari mode pencarian
                showSuggestions(context); // Menampilkan saran seperti semula
              },
              icon: Icon(Icons.clear),
            )
          : IconButton(
              onPressed: () {
                isSearching = true; // Masuk ke Mode pencarian
                showSuggestions(context); // Menampilkan saran berdasarkan query saat ini
              },
              icon: Icon(Icons.search),
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Not used in this case
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? menuList
        : menuList.where((menu) {
            final menuName = menu.name.toLowerCase();
            return menuName.contains(query.toLowerCase());
          }).toList();

    if (query.isNotEmpty) {
      isSearching = true; // Masih dalam mode pencarian saat mengetikkan query
    } else {
      isSearching = false; // Keluar dari mode pencarian jika query kosong
    }

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion.name),
          onTap: () {
            query = suggestion.name;
            close(context, query);
          },
        );
      },
    );
  }
}
