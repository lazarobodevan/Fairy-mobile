import 'package:flutter/cupertino.dart';
import 'package:mobile/models/rounded_filter_option_model.dart';

class FilterChipOptionsListModel{
  final String categoryName;
  Widget? customWidget;
  final List<RoundedFilterOptionModel>? options;

  FilterChipOptionsListModel({required this.categoryName, this.options, this.customWidget});
}