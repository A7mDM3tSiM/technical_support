class Ticket {
  final String id;
  final String lastUpdate;
  final String topic;
  final String status;
  final String priority;
  final String assignedUser;

  Ticket({
    required this.id,
    required this.lastUpdate,
    required this.topic,
    required this.status,
    required this.priority,
    required this.assignedUser,
  });
}
