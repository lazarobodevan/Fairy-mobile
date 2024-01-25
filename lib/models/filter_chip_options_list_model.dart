import 'package:mobile/models/filter_option_model.dart';

class FilterChipOptionsListModel{
  final String categoryName;
  final List<FilterOptionModel> options;

  FilterChipOptionsListModel({required this.categoryName, required this.options});
}