abstract class Post1Event {}

class CheckData extends Post1Event {
  final String owner;
  final String type;

  final String people;

  final String acreage;

  final String cost;

  final String location;
  final String phone;

  CheckData(
    this.owner,
    this.type,
    this.people,
    this.acreage,
    this.cost,
    this.location,
    this.phone,
  );
}
