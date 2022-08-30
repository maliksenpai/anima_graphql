// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimeMobx on _AnimeMobx, Store {
  late final _$animesAtom = Atom(name: '_AnimeMobx.animes', context: context);

  @override
  List<Anime> get animes {
    _$animesAtom.reportRead();
    return super.animes;
  }

  @override
  set animes(List<Anime> value) {
    _$animesAtom.reportWrite(value, super.animes, () {
      super.animes = value;
    });
  }

  late final _$loadingAtom = Atom(name: '_AnimeMobx.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getAnimesAsyncAction =
      AsyncAction('_AnimeMobx.getAnimes', context: context);

  @override
  Future<dynamic> getAnimes() {
    return _$getAnimesAsyncAction.run(() => super.getAnimes());
  }

  @override
  String toString() {
    return '''
animes: ${animes},
loading: ${loading}
    ''';
  }
}
