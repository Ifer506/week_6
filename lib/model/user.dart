class User{

  late final String id ;
  late final String fname;
  late final String age;
  late final String message;
  late final String date;


  User({
    required this.id,
    required this.fname,
    required this.age,
    required this.message,
    required this.date
  });

  @override
  String toString() {
    return '$id, $fname, $age, $message';
  }

}