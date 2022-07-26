class PraticeState {
  bool botWillSpeak;
  int botIndex;
  int userIndex;
  bool showSuggestion;
  String currentBotText;
  String currentUserText;
  String currentUserTempText;
  bool onLinstening;
  List<Map<String, String>> messages;
  PraticeState({
    required this.botWillSpeak,
    required this.botIndex,
    required this.userIndex,
    required this.showSuggestion,
    required this.currentBotText,
    required this.currentUserText,
    required this.currentUserTempText,
    required this.onLinstening,
    required this.messages,
  });

  factory PraticeState.initial() {
    return PraticeState(
      currentUserTempText: "say something",
      onLinstening: false,
      botWillSpeak: true,
      botIndex: 0,
      userIndex: 0,
      showSuggestion: false,
      currentBotText: '',
      currentUserText: '',
      messages: [],
    );
  }

  PraticeState copyWith({
    bool? botWillSpeak,
    int? botIndex,
    int? userIndex,
    bool? showSuggestion,
    String? currentBotText,
    String? currentUserText,
    String? currentUserTempText,
    bool? onLinstening,
    List<Map<String, String>>? messages,
  }) {
    return PraticeState(
      botWillSpeak: botWillSpeak ?? this.botWillSpeak,
      botIndex: botIndex ?? this.botIndex,
      userIndex: userIndex ?? this.userIndex,
      showSuggestion: showSuggestion ?? this.showSuggestion,
      currentBotText: currentBotText ?? this.currentBotText,
      currentUserText: currentUserText ?? this.currentUserText,
      currentUserTempText: currentUserTempText ?? this.currentUserTempText,
      onLinstening: onLinstening ?? this.onLinstening,
      messages: messages ?? this.messages,
    );
  }
}
