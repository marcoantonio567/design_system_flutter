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

class CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  String? errorMsg;
  T? selectedValue;
  bool _isHovered = false;
  bool _isFocused = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.viewModel.selectedValue;
    errorMsg = widget.viewModel.errorText;
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onChanged(T? value) {
    setState(() {
      selectedValue = value;
      errorMsg = widget.viewModel.validator?.call(value);
    });
    widget.viewModel.onChanged?.call(value);
  }

  Color _getBorderColor() {
    if (errorMsg != null) return normalErrorSystemColor;
    if (_isFocused) return normalSecondaryBrandColor;
    if (_isHovered) return lightSecondaryBrandColor;
    return normalSecondaryBaseColorLight.withValues(alpha: 0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() {
            _isHovered = true;
            if (widget.viewModel.isEnabled) {
              _animationController.forward();
            }
          }),
          onExit: (_) => setState(() {
            _isHovered = false;
            if (!_isFocused) {
              _animationController.reverse();
            }
          }),
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() {
                _isFocused = hasFocus;
                if (hasFocus) {
                  _animationController.forward();
                } else if (!_isHovered) {
                  _animationController.reverse();
                }
              });
            },
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: widget.viewModel.isEnabled 
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                lightTertiaryBaseColorLight,
                                lightTertiaryBaseColorLight.withValues(alpha: 0.95),
                              ],
                            )
                          : LinearGradient(
                              colors: [
                                normalTertiaryBaseColorLight,
                                normalTertiaryBaseColorLight.withValues(alpha: 0.8),
                              ],
                            ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _getBorderColor(),
                        width: _isFocused ? 2.0 : 1.5,
                      ),
                      boxShadow: [
                        if (_isHovered || _isFocused) ...[
                          BoxShadow(
                            color: (_isFocused ? normalSecondaryBrandColor : lightSecondaryBrandColor)
                                .withValues(alpha: 0.15),
                            blurRadius: _isFocused ? 12 : 8,
                            offset: const Offset(0, 4),
                            spreadRadius: _isFocused ? 2 : 0,
                          ),
                        ] else ...[
                          BoxShadow(
                            color: normalPrimaryBaseColorLight.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        value: selectedValue,
                        onChanged: widget.viewModel.isEnabled ? _onChanged : null,
                        hint: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          child: Row(
                            children: [
                              if (widget.viewModel.prefixIcon != null) ...[
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: lightSecondaryBrandColor.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: widget.viewModel.prefixIcon!,
                                ),
                                const SizedBox(width: 12),
                              ],
                              Expanded(
                                child: Text(
                                    widget.viewModel.placeholder,
                                    style: paragraph1Regular.copyWith(
                                      color: lightSecondaryBaseColorLight,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                              ),
                            ],
                          ),
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.viewModel.items.map((DropdownItem<T> item) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  if (widget.viewModel.prefixIcon != null) ...[
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: widget.viewModel.prefixIcon!,
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                  if (item.icon != null) ...[
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: item.icon!,
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                  Expanded(
                                    child: Text(
                                      item.label,
                                      style: paragraph1Regular.copyWith(
                                        color: widget.viewModel.isEnabled 
                                            ? normalPrimaryBaseColorLight 
                                            : lightSecondaryBaseColorLight,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList();
                        },
                        dropdownColor: lightTertiaryBaseColorLight,
                        elevation: 12,
                        borderRadius: BorderRadius.circular(16),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: AnimatedBuilder(
                            animation: _rotationAnimation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _rotationAnimation.value * 3.14159,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: (_isFocused ? normalSecondaryBrandColor : lightSecondaryBrandColor)
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: widget.viewModel.isEnabled 
                                        ? (_isFocused ? normalSecondaryBrandColor : normalPrimaryBaseColorLight)
                                        : lightSecondaryBaseColorLight,
                                    size: 20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        isExpanded: true,
                        menuMaxHeight: 300,
                        underline: const SizedBox.shrink(),
                        items: widget.viewModel.items.map((DropdownItem<T> item) {
                          return DropdownMenuItem<T>(
                            value: item.value,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  hoverColor: lightSecondaryBrandColor.withValues(alpha: 0.08),
                                  splashColor: normalSecondaryBrandColor.withValues(alpha: 0.12),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                    child: Row(
                                      children: [
                                        if (item.icon != null) ...[
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: lightSecondaryBrandColor.withValues(alpha: 0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: item.icon!,
                                          ),
                                          const SizedBox(width: 12),
                                        ],
                                        Expanded(
                                          child: Text(
                                            item.label,
                                            style: paragraph1Regular.copyWith(
                                              color: normalPrimaryBaseColorLight,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        if (selectedValue == item.value) ...[
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: normalSecondaryBrandColor,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: lightTertiaryBaseColorLight,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: normalErrorSystemColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: normalErrorSystemColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: normalErrorSystemColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    errorMsg!,
                    style: paragraph2Regular.copyWith(
                      color: normalErrorSystemColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}