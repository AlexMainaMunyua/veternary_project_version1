////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class UserFarmer {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String farmName;
  String country;
  String emailAddress;
  String gender;

  UserFarmer(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.gender,
      this.farmName,
      this.country,
      this.emailAddress});

  UserFarmer.fromMap(Map snapshot, String id)
      : id = id ?? "",
        firstName = snapshot['firstName'],
        lastName = snapshot['lastName'],
        phoneNumber = snapshot['phoneNumber'],
        gender = snapshot['gender'],
        country = snapshot['country'],
        farmName = snapshot['farmName'],
        emailAddress = snapshot['emailAddress'];
  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "farmName": farmName,
      "country": country,
      "emailAddress": emailAddress,
    };
  }
}
//////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

class HealthRecord {
  String id;
  String animalSpecies;
  int ageOfAnimal;
  String nameOfTheAnimal;
  String identificationNumber;
  String clinicalSignsOfDiseases;
  String sicknessDuration;
  String treatmentGiven;
  String durationForTreatment;
  String dateOfTreatment;
  String officerInCharge;

  HealthRecord(
      {this.id,
      this.identificationNumber,
      this.nameOfTheAnimal,
      this.ageOfAnimal,
      this.animalSpecies,
      this.durationForTreatment,
      this.sicknessDuration,
      this.treatmentGiven,
      this.dateOfTreatment,
      this.clinicalSignsOfDiseases,
      this.officerInCharge});

  HealthRecord.fromMap(Map snapshot, String id)
      : id = id ?? '',
        identificationNumber = snapshot['identificationNumber'],
        nameOfTheAnimal = snapshot['nameOfTheAnimal'],
        ageOfAnimal = snapshot['ageOfAnimal'],
        animalSpecies = snapshot['animalSpecies'],
        sicknessDuration = snapshot['sicknessDuration'],
        durationForTreatment = snapshot['durationForTreatment'],
        treatmentGiven = snapshot['treatmentGiven'],
        dateOfTreatment = snapshot['dateForTreatment'],
        clinicalSignsOfDiseases = snapshot['clinicalSignsOfDiseases'],
        officerInCharge = snapshot['officerInCharge'];

  toJson() {
    return {
      "identificationNumber": identificationNumber,
      "nameOfTheAnimal": nameOfTheAnimal,
      "ageOfAnimal": ageOfAnimal,
      "animalSpecies": animalSpecies,
      "sicknessDuration": sicknessDuration,
      "durationForTreatment": durationForTreatment,
      "treatmentGiven": treatmentGiven,
      "dateOfTreatment": dateOfTreatment,
      "clinicalSignsOfDiseases": clinicalSignsOfDiseases,
      "officerInCharge": officerInCharge,
    };
  }
}

///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
class Vaccination {
  // animal species, cattle, Dogs, Poultry, horse, donkey ,cat
  String id;
  int numberOfAnimalVaccinated;
  String nameOfTheAnimal;
  String ageOfTheAnimal;
  String animalGender;
  String previousVaccinationDate;
  String targetedDisease;
  String nameOfTheVaccine;
  String vaxOfficerName;
  String comments;

  Vaccination({
    this.id,
    this.numberOfAnimalVaccinated,
    this.nameOfTheAnimal,
    this.ageOfTheAnimal,
    this.animalGender,
    this.previousVaccinationDate,
    this.targetedDisease,
    this.nameOfTheVaccine,
    this.vaxOfficerName,
    this.comments,
  });

  Vaccination.fromMap(Map snapshot, String id)
      : id = id ?? '',
        numberOfAnimalVaccinated = snapshot['numberOfAnimalVaccinated'],
        nameOfTheAnimal = snapshot['nameOfTheAnimal'],
        ageOfTheAnimal = snapshot['ageOfTheAnimal'],
        animalGender = snapshot['animalGender'],
        previousVaccinationDate = snapshot['previousVaccinationDate'],
        targetedDisease = snapshot['targetedDisease'],
        nameOfTheVaccine = snapshot['nameOfTheVaccine'],
        vaxOfficerName = snapshot['vaxOfficerName'],
        comments = snapshot['comments'];

  toJson() {
    return {
      "numberOfAnimalVaccinated": numberOfAnimalVaccinated,
      "nameOfTheAnimal": nameOfTheAnimal,
      "ageOfTheAnimal": ageOfTheAnimal,
      "animalGender": animalGender,
      "previousVaccinationDate": previousVaccinationDate,
      "targetedDisease": targetedDisease,
      'nameOfTheVaccine': nameOfTheVaccine,
      "vaxOfficerName": vaxOfficerName,
      "comments": vaxOfficerName,
    };
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class ArtificialInseminationRecord {
  String id;
  String nameOfTheCowServed;
  String previousFertilityRecord;
  String timeSeen;
  String timeOfService;
  String dateOfInsemination;
  String breedUsedInAi;
  String nameOfTheBullServed;
  String bullCode;
  String sourceOfService;
  String nextDateOfService;
  String nextDateOfPregnancyDiagnosis;
  String expectedDateOfBirth;
  String nameOfTheInseminator;

  ArtificialInseminationRecord(
      {this.id,
      this.nameOfTheCowServed,
      this.previousFertilityRecord,
      this.timeSeen,
      this.timeOfService,
      this.dateOfInsemination,
      this.breedUsedInAi,
      this.nameOfTheBullServed,
      this.bullCode,
      this.sourceOfService,
      this.nextDateOfService,
      this.nextDateOfPregnancyDiagnosis,
      this.expectedDateOfBirth,
      this.nameOfTheInseminator});

  ArtificialInseminationRecord.fromMap(Map snapshot, String id)
      : id = id ?? "",
        nameOfTheCowServed = snapshot["nameOfTheCowServed"],
        previousFertilityRecord = snapshot["previousFertilityRecord"],
        timeSeen = snapshot["timeSeen"],
        timeOfService = snapshot["timeOfService"],
        dateOfInsemination = snapshot["dateOfInsemination"],
        breedUsedInAi = snapshot["breedUsedInAi"],
        nameOfTheBullServed = snapshot["nameOfTheBullServed"],
        bullCode = snapshot["bullCode"],
        sourceOfService = snapshot["sourceOfService"],
        nextDateOfService = snapshot["nextDateOfService"],
        nextDateOfPregnancyDiagnosis = snapshot["nextDateOfPregnancyDiagnosis"],
        expectedDateOfBirth = snapshot["expectedDateOfBirth"],
        nameOfTheInseminator = snapshot["nameOfTheInseminator"];

  toJson() {
    return {
      "nameOfTheCowServed": nameOfTheCowServed,
      "previousFertilityRecord": previousFertilityRecord,
      "timeSeen": timeSeen,
      "timeOfService": timeOfService,
      "dateOfInsemination": dateOfInsemination,
      "breedUsedInAi": breedUsedInAi,
      "nameOfTheBullServed": nameOfTheBullServed,
      "bullCode": bullCode,
      "sourceOfService": sourceOfService,
      "nextDateOfService": nextDateOfService,
      "nextDateOfPregnancyDiagnosis": nextDateOfPregnancyDiagnosis,
      "expectedDateOfBirth": expectedDateOfBirth,
      "nameOfTheInseminator": nameOfTheInseminator,
    };
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Deworm {
  String id;
  String dateOfDeworming;
  String drugOfChoice;
  String withdrawalPeriod;
  String nextDateOfDewormimng;
  String comments;

  Deworm(
      {this.id,
      this.dateOfDeworming,
      this.drugOfChoice,
      this.withdrawalPeriod,
      this.nextDateOfDewormimng,
      this.comments});

  Deworm.fromMap(Map snapshot, String id)
      : id = id ?? "",
        dateOfDeworming = snapshot["dateOfDeworming"],
        drugOfChoice = snapshot["drugOfChoice"],
        withdrawalPeriod = snapshot["withdrawalPeriod"],
        nextDateOfDewormimng = snapshot["nextDateOfDewormimng"],
        comments = snapshot["comments"];

  toJson() {
    return {
      "dateOfDeworming": dateOfDeworming,
      "drugOfChoice": drugOfChoice,
      "withdrawalPeriod": withdrawalPeriod,
      "nextDateOfDewormimng": nextDateOfDewormimng,
      "comments": comments
    };
  }
}
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

class Poultry extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Poultry(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Poultry.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Goat extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Goat(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Goat.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

class Sheep extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Sheep(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Sheep.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Horse extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Horse(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Horse.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class Donkey extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Donkey(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Donkey.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

class Dog extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Dog(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Dog.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

class Cattle extends Deworm {
  String id;
  String singleAnimal;
  String groupedAnimal;
  String singleCalf;
  String groupedCalf;

  Cattle(
      {this.id,
      this.singleAnimal,
      this.groupedAnimal,
      this.singleCalf,
      this.groupedCalf});

  Cattle.fromMap(Map snapshot, String id)
      : id = id ?? '',
        singleAnimal = snapshot['singleAnimal'],
        groupedAnimal = snapshot['groupedAnimal'],
        singleCalf = snapshot['singleCalf'],
        groupedCalf = snapshot['groupedCalf'];

  @override
  toJson() {
    return {
      "singleAnimal": singleAnimal,
      "groupedAnimal": groupedAnimal,
      "singleCalf": singleCalf,
      "groupedCalf": groupedCalf,
    };
  }
}
////////////////////////////////////////////////////////////////////////////////
