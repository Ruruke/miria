import 'package:miria/repository/time_line_repository.dart';
import 'package:misskey_dart/misskey_dart.dart';

class GlobalTimeLineRepository extends TimelineRepository {
  SocketController? socketController;

  final Misskey misskey;

  GlobalTimeLineRepository(
    this.misskey,
    super.noteRepository,
    super.globalNotificationRepository,
    super.generalSettingsRepository,
    super.tabSetting,
  );

  @override
  void startTimeLine() {
    socketController = misskey.globalTimelineStream(
      onNoteReceived: (note) {
        newerNotes.add(note);

        notifyListeners();
      },
    )..startStreaming();
  }

  @override
  void disconnect() {
    socketController?.disconnect();
  }

  @override
  void reconnect() {
    super.reconnect();
    socketController?.reconnect();
  }

  @override
  void dispose() {
    super.dispose();
    socketController?.disconnect();
    socketController = null;
  }
}
