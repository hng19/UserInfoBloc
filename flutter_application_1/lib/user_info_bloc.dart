import 'dart:async';
import 'dart:html';

class UserInfoBloc {
  int _like = 0;
  StreamController<int> _likeStreamController = StreamController();
  StreamSink<int> get likeSink => _likeStreamController.sink;
  Stream<int> get likeStream => _likeStreamController.stream;

  int _comment = 0;
  StreamController<int> _commentStreamController = StreamController();
  StreamSink<int> get commentSink => _commentStreamController.sink;
  Stream<int> get commentStream => _commentStreamController.stream;

  void increaseLike() async {
    _likeStreamController.sink.add(++_like);
  }

  void increaseComments() {
    _commentStreamController.sink.add(++_comment);
  }

  void dispose() {
    _likeStreamController.close();
    _commentStreamController.close();
  }
}
