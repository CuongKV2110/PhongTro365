abstract class Post2Event {}

class CheckData extends Post2Event {
  final String water;

  final String electricity;

  final String internet;

  CheckData(
    this.water,
    this.electricity,
    this.internet,
  );
}
