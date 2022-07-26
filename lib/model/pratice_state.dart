class PraticeState {
  bool botSpeaking;
  int index;
  int userIndex;
  bool showSuggestion;
  PraticeState({
    required this.botSpeaking,
    required this.index,
    required this.userIndex,
    required this.showSuggestion,
  });

  factory PraticeState.initial() {
    return PraticeState(
      botSpeaking: false,
      index: 0,
      userIndex: 0,
      showSuggestion: false,
    );
  }

  PraticeState copyWith({
    bool? botSpeaking,
    int? index,
    int? userIndex,
    bool? showSuggestion,
  }) {
    return PraticeState(
      botSpeaking: botSpeaking ?? this.botSpeaking,
      index: index ?? this.index,
      userIndex: userIndex ?? this.userIndex,
      showSuggestion: showSuggestion ?? this.showSuggestion,
    );
  }
}
