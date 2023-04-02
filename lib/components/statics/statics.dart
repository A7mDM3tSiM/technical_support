final ticketStatus = <String>["un solved", "in progress", "in review", "done"];
final ticketPriorties = <String>["high", "moderate", "low"];

extension ShortString on String {
  String toShortString(int length) {
    if (this.length > length) {
      return "${substring(0, length)}...";
    }
    return this;
  }
}
