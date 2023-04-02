class Ticket {
  final String id;
  final String topic;
  final String description;
  final String status;
  final String priority;
  final String assignedUser;
  final String? cratedAt;
  final String? updatedAt;

  Ticket({
    required this.id,
    required this.topic,
    required this.description,
    required this.status,
    required this.priority,
    required this.assignedUser,
    this.cratedAt,
    this.updatedAt,
  });
}
