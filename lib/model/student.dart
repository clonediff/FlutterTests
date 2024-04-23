class Student {
  int? id;
  String name;

  Student(this.id, this.name);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  Student.fromMap(Map<String, dynamic> json)
      : this(
          json['id'],
          json['name'],
        );
}
