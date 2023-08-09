import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit() : super( const Locale("zh"));

  void changeLocale(Locale locale) {
    emit(locale);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final theme = json['Locale'];
    // print("theme: $theme");
    switch (theme) {
      case 'zh':
        return const Locale("zh");
      case 'en_US':
        return const Locale("en", "US");
    }
    return const Locale("zh");
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    print("state.toString(): ${state.toString()}");
    return {
      "Locale": state.toString()
    };
  }
}
