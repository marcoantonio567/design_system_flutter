import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'dropdown_view_model.dart';

class CustomDropdown<T> extends StatefulWidget {
  final DropdownViewModel<T> viewModel;

  const CustomDropdown._({super.key, required this.viewModel});

  @override
  CustomDropdownState<T> createState() => CustomDropdownState<T>();

  static Widget instantiate<T>({Key? key, required DropdownViewModel<T> viewModel}) {
    return CustomDropdown<T>._(key: key, viewModel: viewModel);
  }
}

class CustomDropdownState<T> extends State<CustomDropdown<T>> {
  String? errorMsg;
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.viewModel.selectedValue;
    errorMsg = widget.viewModel.errorText;
  }

  void _onChanged(T? value) {
    setState(() {
      selectedValue = value;
      errorMsg = widget.viewModel.validator?.call(value);
    });
    widget.viewModel.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.viewModel.isEnabled ? lightTertiaryBaseColorLight : normalTertiaryBaseColorLight,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: errorMsg != null 
                  ? normalErrorSystemColor 
                  : normalPrimaryBaseColorLight,
              width: 1.5,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: selectedValue,
              onChanged: widget.viewModel.isEnabled ? _onChanged : null,
              hint: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    if (widget.viewModel.prefixIcon != null) ...[
                      widget.viewModel.prefixIcon!,
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: Text(
                        widget.viewModel.placeholder,
                        style: paragraph1Regular.copyWith(
                          color: lightSecondaryBaseColorLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedItemBuilder: (BuildContext context) {
                return widget.viewModel.items.map((DropdownItem<T> item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Row(
                      children: [
                        if (widget.viewModel.prefixIcon != null) ...[
                          widget.viewModel.prefixIcon!,
                          const SizedBox(width: 8),
                        ],
                        if (item.icon != null) ...[
                          item.icon!,
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            item.label,
                            style: paragraph1Regular.copyWith(
                              color: widget.viewModel.isEnabled 
                                  ? normalPrimaryBaseColorLight 
                                  : lightSecondaryBaseColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              dropdownColor: lightTertiaryBaseColorLight,
              icon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: widget.viewModel.isEnabled 
                      ? normalPrimaryBaseColorLight 
                      : lightSecondaryBaseColorLight,
                ),
              ),
              isExpanded: true,
              items: widget.viewModel.items.map((DropdownItem<T> item) {
                return DropdownMenuItem<T>(
                  value: item.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        if (item.icon != null) ...[
                          item.icon!,
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            item.label,
                            style: paragraph1Regular.copyWith(
                              color: normalPrimaryBaseColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 4),
          Text(
            errorMsg!,
            style: paragraph2Regular.copyWith(
              color: normalErrorSystemColor,
            ),
          ),
        ],
      ],
    );
  }
}