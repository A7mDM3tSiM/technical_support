class Ticket {
  final String? id;
  final String? topic;
  final String? description;
  final String? status;
  final String? priority;
  final String? assignedUser;
  final String? cratedAt;
  final String? updatedAt;

  const Ticket({
    this.id,
    this.topic,
    this.description,
    this.status,
    this.priority,
    this.assignedUser,
    this.cratedAt,
    this.updatedAt,
  });
}
