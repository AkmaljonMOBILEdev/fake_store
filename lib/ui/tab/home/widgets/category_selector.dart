import 'package:flutter/material.dart';
import 'package:fake_store/ui/tab/home/widgets/category_holder.dart';
import 'package:fake_store/utils/size_extensions.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.onSelected,
  });

  final List<String> categories;
  final ValueChanged<String> onSelected;

  @override
  CategorySelectorState createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    selectedCategory =
        widget.categories.isNotEmpty ? widget.categories[0] : "All";
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', ...widget.categories.where((c) => c != 'All')];
    return SizedBox(
      height: editH(70),
      child: ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: editW(20), vertical: editH(10)),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryHolder(
            title: categories[index],
            isSelected: categories[index] == selectedCategory,
            onTap: () {
              setState(() {
                selectedCategory = categories[index];
                widget.onSelected(categories[index]);
              });
            },
          );
        },
      ),
    );
  }
}
