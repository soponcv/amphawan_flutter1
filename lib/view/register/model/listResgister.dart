class ListRegister {
  final String id;
  final String inputName;
  final String inputLastName;
  final String inputAge;
  final String inputIdCard;
  final String inputPhone;
  final String inputDisease;
  final String inputBNum;
  final String inputBMoo;
  final String inputBSoy;
  final String inputBRoad;
  final String inputBTambon;
  final String inputBAmpher;
  final String inputBJangwat;
  final String inputBZip;
  final String inputNameBrother;
  final String inputLastNameBrother;
  final String inputNameMather;
  final String inputLastNameMather;
  final String inputNameHusband;
  final String inputLastNameHusband;
  final String inputNameWife;
  final String inputLastNameWife;
  final String inputEmergency;
  final String inputReEmergency;
  final String inputEmAddress;
  final String inputEmPhone;
  final String inputMeditation;
  final String inputJangwat;
  final String inputPractice;
  final String inputNumber;
  final String inputInstructor;
  final String inputAmphawanNumber;
  final String inputLife;
  final String inputAllure;

  ListRegister(
      {this.id,
      this.inputName,
      this.inputLastName,
      this.inputAge,
      this.inputIdCard,
      this.inputPhone,
      this.inputDisease,
      this.inputBNum,
      this.inputBMoo,
      this.inputBSoy,
      this.inputBRoad,
      this.inputBTambon,
      this.inputBAmpher,
      this.inputBJangwat,
      this.inputBZip,
      this.inputNameBrother,
      this.inputLastNameBrother,
      this.inputNameMather,
      this.inputLastNameMather,
      this.inputNameHusband,
      this.inputLastNameHusband,
      this.inputNameWife,
      this.inputLastNameWife,
      this.inputEmergency,
      this.inputReEmergency,
      this.inputEmAddress,
      this.inputEmPhone,
      this.inputMeditation,
      this.inputJangwat,
      this.inputPractice,
      this.inputNumber,
      this.inputInstructor,
      this.inputAmphawanNumber,
      this.inputLife,
      this.inputAllure});

  factory ListRegister.fromJson(Map<String, dynamic> json) {
    return ListRegister(
        id: json['id'] as String,
        inputName: json['name'] as String,
        inputLastName: json['lastname'] as String,
        inputAge: json['age'] as String,
        inputIdCard: json['idCard'] as String,
        inputPhone: json['phone'] as String,
        inputDisease: json['disease'] as String,
        inputBNum: json['bNumber'] as String,
        inputBMoo: json['bMoo'] as String,
        inputBSoy: json['bSoy'] as String,
        inputBRoad: json['bRoad'] as String,
        inputBTambon: json['bTambon'] as String,
        inputBAmpher: json['bAmpher'] as String,
        inputBJangwat: json['bJangwat'] as String,
        inputBZip: json['bZip'] as String,
        inputNameBrother: json['bameBrother'] as String,
        inputLastNameBrother: json['lastNameBrother'] as String,
        inputNameMather: json['nameMather'] as String,
        inputLastNameMather: json['lastNameMather'] as String,
        inputNameHusband: json['nameHusband'] as String,
        inputLastNameHusband: json['lastNameHusband'] as String,
        inputNameWife: json['nameWife'] as String,
        inputLastNameWife: json['lastNameWife'] as String,
        inputEmergency: json['emergency'] as String,
        inputReEmergency: json['reEmergency'] as String,
        inputEmAddress: json['emAddress'] as String,
        inputEmPhone: json['emPhone'] as String,
        inputMeditation: json['meditation'] as String,
        inputJangwat: json['meditationJangwat'] as String, //
        inputPractice: json['practice'] as String,
        inputNumber: json['practiceNumber'] as String, //
        inputInstructor: json['instructor'] as String,
        inputAmphawanNumber: json['amphawanNumber'] as String,
        inputLife: json['life'] as String,
        inputAllure: json['allure'] as String);
  }
}
