class Standards {
  List<Classess>? classess;

  Standards({this.classess});

  Standards.fromJson(Map<String, dynamic> json) {
    if (json['classess'] != null) {
      classess = <Classess>[];
      json['classess'].forEach((v) {
        classess!.add(new Classess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classess != null) {
      data['classess'] = this.classess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classess {
  String? standard;
  List<Subjects>? subjects;

  Classess({this.standard, this.subjects});

  Classess.fromJson(Map<String, dynamic> json) {
    standard = json['standard'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standard'] = this.standard;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? subjectName;
  String? subjectImage;

  Subjects({this.subjectName, this.subjectImage});

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    subjectImage = json['subject_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_name'] = this.subjectName;
    data['subject_image'] = this.subjectImage;
    return data;
  }
}