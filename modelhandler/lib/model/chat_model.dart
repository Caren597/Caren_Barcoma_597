class Message {
  final int? id;
  final String username;
  final String message;
  final DateTime? createdAt;

  Message({
    this.id,
    required this.username,
    required this.message,
    this.createdAt,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    // task 4
    Map<String, dynamic> map = {
      'id': 1,
      'username': 'Alice',
      'message': 'Hello, world!',
      'created_at': '2024-06-01T12:00:00Z',
    };
    throw UnimplementedError('task 4: implement fromMap');
  }

  Map<String, dynamic> toMap() {
    return {'username': username, 'message': message};
  }
}
