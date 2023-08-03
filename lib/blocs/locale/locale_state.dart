part of 'locale_cubit.dart';

class LocaleState extends Equatable {
  Locale locale;
  LocaleState({Key? key, this.locale = const Locale("zh")}) : super();
  @override
  List<Object> get props => [locale];

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}

class LocaleInitial extends LocaleState {}
