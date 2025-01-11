import 'package:firebase_database/firebase_database.dart';

class Database_mthds {
  final ref = FirebaseDatabase.instance.ref();
  //Query ref2 = FirebaseDatabase.instance.ref().child('patientData');
  DateTime getNow = DateTime.now();
  //final math = Random().nextBool();

  Future updateData(key, name, id, dob, tel, email, city, prov, sex) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    String keyF = key.toString();
    Map<String, String> details = {
      'Name': name,
      'NID': id,
      'DOB': dob,
      'Phone': tel,
      'Email': email,
      'Place': city,
      'Province': prov,
      'Sex': sex,
      'updateTime': dateNow,
    };
    await ref.child('patientdata').child(keyF).update(details);
  }

  Future pushData(name, id, dob, tel, email, city, prov, sex) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    Map<String, String> details = {
      'Name': name,
      'NID': id,
      'DOB': dob,
      'Phone': tel,
      'Email': email,
      'Place': city,
      'Province': prov,
      'Sex': sex,
      'Status': 'Pending',
      'RegisterDate': dateNow,
    };
    await ref.child('patientdata').push().set(details);
  }

  Future updateDataBG(key, BG) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    String keyF = key.toString();
    Map<String, String> details = {
      'BG': BG,
      'updateTime': dateNow,
    };
    print("Success");
    await ref.child('patientdata').child(keyF).update(details);
  }

  Future updateDataPRA(key, PRA) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    String keyF = key.toString();
    Map<String, String> details = {
      'PRA': PRA,
      'updateTime': dateNow,
    };
    //print("Success");
    await ref.child('patientdata').child(keyF).update(details);
  }

  Future updateDataRU(key, RU) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    String keyF = key.toString();
    Map<String, String> details = {
      'RU': RU,
      'updateTime': dateNow,
    };
    //print("Success");
    await ref.child('patientdata').child(keyF).update(details);
  }

  Future updateDataStatus(key, Status) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    String keyF = key.toString();
    Map<String, String> details = {
      'Status': Status,
      'updateTime': dateNow,
    };
    //print("Success");
    await ref.child('patientdata').child(keyF).update(details);
  }

  Future pushDataAdd(name, id, dob, BG, PRA, Status, tel, email, city, prov,
      sex, Ddate, RU, spCon) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    Map<String, String> details = {
      'Name': name,
      'NID': id,
      'DOB': dob,
      'BG': BG,
      'PRA': PRA,
      'RU': RU,
      'Status': Status,
      'Phone': tel,
      'Email': email,
      'Place': city,
      'Province': prov,
      'Sex': sex,
      'DDate': Ddate,
      'RegisterDate': dateNow,
      'Considerations': spCon,
    };
    await ref.child('patientdata').push().set(details);
  }

  Future addUser(userName) async {
    int DayNow = getNow.day;
    int YearNow = getNow.year;
    int MonthNow = getNow.month;
    String dateNow = DayNow.toString() +
        "/" +
        MonthNow.toString() +
        "/" +
        YearNow.toString();

    //String keyF = key.toString();
    Map<String, String> details = {
      'userName': userName,
      'updateTime': dateNow,
    };
    //print("Success");
    await ref.child('users').push().set(details);
  }
}
