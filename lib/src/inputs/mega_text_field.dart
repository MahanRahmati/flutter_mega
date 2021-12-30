import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mega/mega.dart';

enum OverlayVisibilityMode { never, editing, notEditing, always }

class _MegaTextFieldSelectionGestureDetectorBuilder
    extends TextSelectionGestureDetectorBuilder {
  _MegaTextFieldSelectionGestureDetectorBuilder({
    required _MegaTextFieldState state,
  })  : _state = state,
        super(delegate: state);
  final _MegaTextFieldState _state;

  @override
  void onSingleTapUp(TapUpDetails details) {
    if (_state._clearGlobalKey.currentContext != null) {
      final RenderBox renderBox = _state._clearGlobalKey.currentContext!
          .findRenderObject() as RenderBox;
      final Offset localOffset =
          renderBox.globalToLocal(details.globalPosition);
      if (renderBox.hitTest(BoxHitTestResult(), position: localOffset)) return;
    }
    super.onSingleTapUp(details);
    _state._requestKeyboard();
    if (_state.widget.onTap != null) _state.widget.onTap!();
  }

  @override
  void onDragSelectionEnd(DragEndDetails details) {
    _state._requestKeyboard();
  }
}

class MegaTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool readOnly;
  final Color accentColor;
  final bool obscureText;
  final bool autocorrect;
  final bool? showCursor;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final Brightness? keyboardAppearance;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final OverlayVisibilityMode prefixMode;
  final OverlayVisibilityMode suffixMode;
  final OverlayVisibilityMode clearButtonMode;

  const MegaTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.strutStyle,
    this.textDirection,
    this.readOnly = false,
    this.accentColor = MegaStyle.accentColor1,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.focusNode,
    this.autofocus = false,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.keyboardAppearance,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.hint,
    this.prefix,
    this.suffix,
    this.prefixMode = OverlayVisibilityMode.always,
    this.suffixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
  }) : super(key: key);

  bool get selectionEnabled => enableInteractiveSelection;

  @override
  _MegaTextFieldState createState() => _MegaTextFieldState();
}

class _MegaTextFieldState extends State<MegaTextField>
    with RestorationMixin
    implements TextSelectionGestureDetectorBuilderDelegate, AutofillClient {
  final GlobalKey _clearGlobalKey = GlobalKey();
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  MaxLengthEnforcement get _effectiveMaxLengthEnforcement =>
      widget.maxLengthEnforcement ??
      LengthLimitingTextInputFormatter.getDefaultMaxLengthEnforcement();

  bool focused = false;
  bool hovering = false;
  bool _showSelectionHandles = false;
  late _MegaTextFieldSelectionGestureDetectorBuilder
      _selectionGestureDetectorBuilder;

  @override
  bool get forcePressEnabled => true;

  @override
  final GlobalKey<EditableTextState> editableTextKey =
      GlobalKey<EditableTextState>();

  @override
  bool get selectionEnabled => widget.selectionEnabled;

  bool get enabled => widget.enabled ?? true;

  @override
  void initState() {
    super.initState();
    _selectionGestureDetectorBuilder =
        _MegaTextFieldSelectionGestureDetectorBuilder(state: this);
    if (widget.controller == null) {
      _createLocalController();
    }
    _effectiveFocusNode.canRequestFocus = enabled;
    _effectiveFocusNode.addListener(_handleFocusChanged);
  }

  bool get _canRequestFocus {
    final NavigationMode mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return enabled;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _effectiveFocusNode.canRequestFocus = _canRequestFocus;
  }

  @override
  void didUpdateWidget(MegaTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      unregisterFromRestoration(_controller!);
      _controller!.dispose();
      _controller = null;
    }

    if (widget.focusNode != oldWidget.focusNode) {
      (oldWidget.focusNode ?? _focusNode)?.removeListener(_handleFocusChanged);
      (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
    }

    _effectiveFocusNode.canRequestFocus = _canRequestFocus;

    if (_effectiveFocusNode.hasFocus &&
        widget.readOnly != oldWidget.readOnly &&
        enabled) {
      if (_effectiveController.selection.isCollapsed) {
        _showSelectionHandles = !widget.readOnly;
      }
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (_controller != null) _registerController();
  }

  void _registerController() {
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) _registerController();
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChanged);
    _focusNode?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  EditableTextState? get _editableText => editableTextKey.currentState;

  void _requestKeyboard() {
    _editableText?.requestKeyboard();
  }

  bool _shouldShowSelectionHandles(SelectionChangedCause? cause) {
    if (!_selectionGestureDetectorBuilder.shouldShowSelectionToolbar) {
      return false;
    }
    if (cause == SelectionChangedCause.keyboard) return false;
    if (widget.readOnly && _effectiveController.selection.isCollapsed) {
      return false;
    }
    if (!enabled) return false;
    if (cause == SelectionChangedCause.longPress) return true;
    if (_effectiveController.text.isNotEmpty) return true;
    return false;
  }

  void _handleFocusChanged() {
    setState(() {});
  }

  void _handleSelectionChanged(
      TextSelection selection, SelectionChangedCause? cause) {
    final bool willShowSelectionHandles = _shouldShowSelectionHandles(cause);
    if (willShowSelectionHandles != _showSelectionHandles) {
      setState(() => _showSelectionHandles = willShowSelectionHandles);
    }
    if (cause == SelectionChangedCause.drag) {
      _editableText?.bringIntoView(selection.extent);
    }
  }

  @override
  String get autofillId => _editableText!.autofillId;

  @override
  void autofill(TextEditingValue newEditingValue) =>
      _editableText!.autofill(newEditingValue);

  @override
  TextInputConfiguration get textInputConfiguration {
    final List<String>? autofillHints =
        widget.autofillHints?.toList(growable: false);
    final AutofillConfiguration autofillConfiguration = autofillHints != null
        ? AutofillConfiguration(
            uniqueIdentifier: autofillId,
            autofillHints: autofillHints,
            currentEditingValue: _effectiveController.value,
            hintText: widget.hint,
          )
        : AutofillConfiguration.disabled;

    return _editableText!.textInputConfiguration
        .copyWith(autofillConfiguration: autofillConfiguration);
  }

  bool _shouldShowAttachment({
    required OverlayVisibilityMode attachment,
    required bool hasText,
  }) {
    switch (attachment) {
      case OverlayVisibilityMode.never:
        return false;
      case OverlayVisibilityMode.always:
        return true;
      case OverlayVisibilityMode.editing:
        return hasText;
      case OverlayVisibilityMode.notEditing:
        return !hasText;
    }
  }

  bool _showPrefixWidget(TextEditingValue text) =>
      widget.prefix != null &&
      _shouldShowAttachment(
        attachment: widget.prefixMode,
        hasText: text.text.isNotEmpty,
      );

  bool _showSuffixWidget(TextEditingValue text) =>
      widget.suffix != null &&
      _shouldShowAttachment(
        attachment: widget.suffixMode,
        hasText: text.text.isNotEmpty,
      );

  bool _showClearButton(TextEditingValue text) => _shouldShowAttachment(
        attachment: widget.clearButtonMode,
        hasText: text.text.isNotEmpty,
      );

  @override
  Widget build(BuildContext context) {
    final Brightness keyboardAppearance =
        widget.keyboardAppearance ?? MediaQuery.of(context).platformBrightness;
    final TextEditingController controller = _effectiveController;
    final FocusNode focusNode = _effectiveFocusNode;
    final List<TextInputFormatter> formatters = <TextInputFormatter>[
      ...?widget.inputFormatters,
      if (widget.maxLength != null)
        LengthLimitingTextInputFormatter(
          widget.maxLength,
          maxLengthEnforcement: _effectiveMaxLengthEnforcement,
        ),
    ];
    ToolbarOptions toolbarOptions = widget.obscureText
        ? const ToolbarOptions(selectAll: true, paste: true)
        : const ToolbarOptions(
            copy: true,
            cut: true,
            selectAll: true,
            paste: true,
          );
    TextSelectionControls? textSelectionControls = widget.selectionControls;
    final cursorOffset = Offset(
      -2 / MediaQuery.of(context).devicePixelRatio,
      _effectiveController.text.isEmpty ? -2 : 0,
    );
    final smartDashesType =
        widget.obscureText ? SmartDashesType.disabled : SmartDashesType.enabled;
    final smartQuotesType =
        widget.obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled;
    return GestureDetector(
      onTap: !enabled || widget.readOnly
          ? null
          : () {
              if (!controller.selection.isValid) {
                controller.selection = TextSelection.collapsed(
                  offset: controller.text.length,
                );
              }
              _requestKeyboard();
            },
      child: FocusableActionDetector(
        focusNode: !enabled ? null : widget.focusNode,
        autofocus: !enabled ? false : widget.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        onShowFocusHighlight: (focus) => setState(() => focused = focus),
        child: AnimatedContainer(
          constraints: const BoxConstraints(
            minHeight: MegaStyle.textFieldSize + 2,
          ),
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: MegaStyle.borderRadius,
            border: Border.all(
              color: focused ? MegaStyle.accentColor1 : borderColor(context),
            ),
            color: !enabled
                ? backgroundColorDisabled(context)
                : hovering
                    ? hoverColor(context)
                    : backgroundColor(context),
          ),
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _effectiveController,
            child: Padding(
              padding: MegaStyle.horizontal,
              child: RepaintBoundary(
                child: UnmanagedRestorationScope(
                  bucket: bucket,
                  child: EditableText(
                    key: editableTextKey,
                    readOnly: widget.readOnly || !enabled,
                    toolbarOptions: toolbarOptions,
                    showCursor: widget.showCursor,
                    showSelectionHandles: _showSelectionHandles,
                    controller: controller,
                    focusNode: focusNode,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    textCapitalization: widget.textCapitalization,
                    style: subtitle1(context),
                    strutStyle: widget.strutStyle,
                    textAlign: TextAlign.start,
                    textDirection: widget.textDirection,
                    autofocus: widget.autofocus,
                    obscuringCharacter: "•",
                    obscureText: widget.obscureText,
                    autocorrect: widget.autocorrect,
                    smartDashesType: smartDashesType,
                    smartQuotesType: smartQuotesType,
                    enableSuggestions: widget.enableSuggestions,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    expands: widget.expands,
                    selectionColor:
                        focusNode.hasFocus ? widget.accentColor : null,
                    selectionControls:
                        widget.selectionEnabled ? textSelectionControls : null,
                    onChanged: widget.onChanged,
                    onSelectionChanged: _handleSelectionChanged,
                    onEditingComplete: widget.onEditingComplete,
                    onSubmitted: widget.onSubmitted,
                    onAppPrivateCommand: widget.onAppPrivateCommand,
                    inputFormatters: formatters,
                    rendererIgnoresPointer: true,
                    mouseCursor: MouseCursor.defer,
                    cursorWidth: MegaStyle.cursorWidth,
                    cursorHeight: MegaStyle.cursorHeight,
                    cursorRadius: const Radius.circular(MegaStyle.cursorRadius),
                    cursorColor: secondaryTextColor(context),
                    selectionHeightStyle: ui.BoxHeightStyle.tight,
                    selectionWidthStyle: ui.BoxWidthStyle.tight,
                    cursorOpacityAnimates: true,
                    cursorOffset: cursorOffset,
                    paintCursorAboveText: false,
                    backgroundCursorColor: disabledColor(context),
                    scrollPadding: MegaStyle.scrollPadding,
                    keyboardAppearance: keyboardAppearance,
                    enableInteractiveSelection:
                        widget.enableInteractiveSelection,
                    dragStartBehavior: DragStartBehavior.start,
                    scrollController: widget.scrollController,
                    scrollPhysics: widget.scrollPhysics,
                    autofillClient: this,
                    autocorrectionTextRectColor: MegaStyle.accentColor1,
                    clipBehavior: Clip.antiAlias,
                    restorationId: 'editable',
                    enableIMEPersonalizedLearning:
                        widget.enableIMEPersonalizedLearning,
                  ),
                ),
              ),
            ),
            builder:
                (BuildContext context, TextEditingValue? text, Widget? child) {
              return Row(
                crossAxisAlignment:
                    widget.maxLines == null || widget.maxLines! > 1
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                children: [
                  if (_showPrefixWidget(text!))
                    Padding(padding: MegaStyle.normal, child: widget.prefix!),
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      alignment: widget.maxLines == null || widget.maxLines! > 1
                          ? Alignment.topCenter
                          : Alignment.center,
                      children: [
                        if (widget.hint != null && text.text.isEmpty)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: MegaStyle.horizontal,
                              child: Text(
                                widget.hint!,
                                maxLines: widget.maxLines,
                                overflow: TextOverflow.ellipsis,
                                style: subtitle1(context),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        child!,
                      ],
                    ),
                  ),
                  if (_showSuffixWidget(text))
                    widget.suffix!
                  else if (_showClearButton(text))
                    GestureDetector(
                      key: _clearGlobalKey,
                      onTap: widget.enabled ?? true
                          ? () {
                              final bool textChanged =
                                  _effectiveController.text.isNotEmpty;
                              _effectiveController.clear();
                              if (widget.onChanged != null && textChanged) {
                                widget.onChanged!(_effectiveController.text);
                              }
                            }
                          : null,
                      child: Padding(
                        padding: MegaStyle.normal,
                        child: Icon(
                          Icons.clear_outlined,
                          size: MegaStyle.iconSize,
                          color: secondaryTextColor(context),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
