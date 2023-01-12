class Ticket {
  final String id;
  final String topic;
  final String status;
  final String priority;
  final String assignedUser;
  final String cratedAt;
  final String updatedAt;

  Ticket({
    required this.id,
    required this.topic,
    required this.status,
    required this.priority,
    required this.assignedUser,
    required this.cratedAt,
    required this.updatedAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      topic: json['topic'],
      status: json['status'],
      priority: json['priority'],
      assignedUser: json['assignedUser'],
      cratedAt: json['cratedAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
