enum MyLoadsTabModel {
  booked,
  past;

  bool get isBooked => this == MyLoadsTabModel.booked;
  bool get isPast => this == MyLoadsTabModel.past;
}
