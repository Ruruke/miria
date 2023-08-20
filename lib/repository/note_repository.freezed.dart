// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteStatus {
  bool get isCwOpened => throw _privateConstructorUsedError;
  bool get isLongVisible => throw _privateConstructorUsedError;
  bool get isReactionedRenote => throw _privateConstructorUsedError;
  bool get isLongVisibleInitialized => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteStatusCopyWith<NoteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStatusCopyWith<$Res> {
  factory $NoteStatusCopyWith(
          NoteStatus value, $Res Function(NoteStatus) then) =
      _$NoteStatusCopyWithImpl<$Res, NoteStatus>;
  @useResult
  $Res call(
      {bool isCwOpened,
      bool isLongVisible,
      bool isReactionedRenote,
      bool isLongVisibleInitialized});
}

/// @nodoc
class _$NoteStatusCopyWithImpl<$Res, $Val extends NoteStatus>
    implements $NoteStatusCopyWith<$Res> {
  _$NoteStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCwOpened = null,
    Object? isLongVisible = null,
    Object? isReactionedRenote = null,
    Object? isLongVisibleInitialized = null,
  }) {
    return _then(_value.copyWith(
      isCwOpened: null == isCwOpened
          ? _value.isCwOpened
          : isCwOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isLongVisible: null == isLongVisible
          ? _value.isLongVisible
          : isLongVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isReactionedRenote: null == isReactionedRenote
          ? _value.isReactionedRenote
          : isReactionedRenote // ignore: cast_nullable_to_non_nullable
              as bool,
      isLongVisibleInitialized: null == isLongVisibleInitialized
          ? _value.isLongVisibleInitialized
          : isLongVisibleInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteStatusCopyWith<$Res>
    implements $NoteStatusCopyWith<$Res> {
  factory _$$_NoteStatusCopyWith(
          _$_NoteStatus value, $Res Function(_$_NoteStatus) then) =
      __$$_NoteStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isCwOpened,
      bool isLongVisible,
      bool isReactionedRenote,
      bool isLongVisibleInitialized});
}

/// @nodoc
class __$$_NoteStatusCopyWithImpl<$Res>
    extends _$NoteStatusCopyWithImpl<$Res, _$_NoteStatus>
    implements _$$_NoteStatusCopyWith<$Res> {
  __$$_NoteStatusCopyWithImpl(
      _$_NoteStatus _value, $Res Function(_$_NoteStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCwOpened = null,
    Object? isLongVisible = null,
    Object? isReactionedRenote = null,
    Object? isLongVisibleInitialized = null,
  }) {
    return _then(_$_NoteStatus(
      isCwOpened: null == isCwOpened
          ? _value.isCwOpened
          : isCwOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isLongVisible: null == isLongVisible
          ? _value.isLongVisible
          : isLongVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isReactionedRenote: null == isReactionedRenote
          ? _value.isReactionedRenote
          : isReactionedRenote // ignore: cast_nullable_to_non_nullable
              as bool,
      isLongVisibleInitialized: null == isLongVisibleInitialized
          ? _value.isLongVisibleInitialized
          : isLongVisibleInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteStatus with DiagnosticableTreeMixin implements _NoteStatus {
  const _$_NoteStatus(
      {required this.isCwOpened,
      required this.isLongVisible,
      required this.isReactionedRenote,
      required this.isLongVisibleInitialized});

  @override
  final bool isCwOpened;
  @override
  final bool isLongVisible;
  @override
  final bool isReactionedRenote;
  @override
  final bool isLongVisibleInitialized;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteStatus(isCwOpened: $isCwOpened, isLongVisible: $isLongVisible, isReactionedRenote: $isReactionedRenote, isLongVisibleInitialized: $isLongVisibleInitialized)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteStatus'))
      ..add(DiagnosticsProperty('isCwOpened', isCwOpened))
      ..add(DiagnosticsProperty('isLongVisible', isLongVisible))
      ..add(DiagnosticsProperty('isReactionedRenote', isReactionedRenote))
      ..add(DiagnosticsProperty(
          'isLongVisibleInitialized', isLongVisibleInitialized));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteStatus &&
            (identical(other.isCwOpened, isCwOpened) ||
                other.isCwOpened == isCwOpened) &&
            (identical(other.isLongVisible, isLongVisible) ||
                other.isLongVisible == isLongVisible) &&
            (identical(other.isReactionedRenote, isReactionedRenote) ||
                other.isReactionedRenote == isReactionedRenote) &&
            (identical(
                    other.isLongVisibleInitialized, isLongVisibleInitialized) ||
                other.isLongVisibleInitialized == isLongVisibleInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCwOpened, isLongVisible,
      isReactionedRenote, isLongVisibleInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteStatusCopyWith<_$_NoteStatus> get copyWith =>
      __$$_NoteStatusCopyWithImpl<_$_NoteStatus>(this, _$identity);
}

abstract class _NoteStatus implements NoteStatus {
  const factory _NoteStatus(
      {required final bool isCwOpened,
      required final bool isLongVisible,
      required final bool isReactionedRenote,
      required final bool isLongVisibleInitialized}) = _$_NoteStatus;

  @override
  bool get isCwOpened;
  @override
  bool get isLongVisible;
  @override
  bool get isReactionedRenote;
  @override
  bool get isLongVisibleInitialized;
  @override
  @JsonKey(ignore: true)
  _$$_NoteStatusCopyWith<_$_NoteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}