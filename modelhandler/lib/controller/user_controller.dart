import 'package:modelhandler/model/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentController {
  final supabase = Supabase.instance.client;

  Future<List<Student>> getStudents() async {
    final data = await supabase.from('students').select();
    return data.map((item) => Student.fromMap(item)).toList();
  }

  Future<void> addStudent(Student student) async {
    await supabase.from('students').insert(student.toMap());
  }

  Future<void> deleteStudent(int id) async {
    await supabase.from('students').delete().eq('id', id);
  }

  
  List<Student> searchStudents(List<Student> students, String query) {
    if (query.isEmpty) return students;
    final lowerQuery = query.toLowerCase();
    return students.where((student) =>
        student.name.toLowerCase().contains(lowerQuery)).toList();
  }


  double getClassAverage(List<Student> students) {
    if (students.isEmpty) return 0;
    double total = 0;
    for (var student in students) {
      total += student.average; 
    }
    return total / students.length;
  }


  int countPassed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Passed') count++;
    }
    return count;
  }


  int countFailed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Failed') count++;
    }
    return count;
  }
}

