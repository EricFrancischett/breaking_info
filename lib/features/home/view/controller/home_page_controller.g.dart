// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$charactersAtom =
      Atom(name: '_HomePageControllerBase.characters', context: context);

  @override
  Resource<List<CharactersEntity>, CharactersError> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(Resource<List<CharactersEntity>, CharactersError> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_HomePageControllerBase.fetchCharacters', context: context);

  @override
  Future<Resource<List<CharactersEntity>, CharactersError>> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters}
    ''';
  }
}
