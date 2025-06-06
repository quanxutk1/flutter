class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text; // Tieu de cau hoi
  final List<String> answers; // danh sach cau tra loi

  List<String> getShuffleAnswer() {
    List<String> shuffle = List.of(answers);
    shuffle.shuffle();
    return shuffle;
  }
}
