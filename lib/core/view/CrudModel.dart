import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:veternary_project_version1/core/model/veternaryModel.dart';
import 'package:veternary_project_version1/core/services/service.dart';

import '../../locator.dart';

class CRUDHealthRecordModel extends ChangeNotifier {
  HealthRecordService _healthRecordService = locator<HealthRecordService>();

  List<HealthRecord> healthRecord;

  Future<List<HealthRecord>> fetchHealthRecords() async {
    var results = await _healthRecordService.getDataCollection();
    healthRecord = results.documents
        .map((doc) => HealthRecord.fromMap(doc.data, doc.documentID))
        .toList();

    return healthRecord;
  }

  Stream<QuerySnapshot> fetchHealthRecordAsStream() {
    return _healthRecordService.streamDataCollection();
  }

  Future<HealthRecord> getHealthRecordById(String id) async {
    var doc = await _healthRecordService.getDocumentById(id);
    return HealthRecord.fromMap(doc.data, doc.documentID);
  }

  Future removeHealthRecord(String id) async {
    await _healthRecordService.removeDocument(id);
    return;
  }

  Future updateHealthRecord(HealthRecord data, String id) async {
    await _healthRecordService.updateDocument(data.toJson(), id);
    return;
  }

  Future addHealthRecord(HealthRecord data) async {
    var result = await _healthRecordService.addDocument(data.toJson());

    return print(result);
  }
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class CRUDVaccinationModel extends ChangeNotifier {
  VaccinationService _vaccinationService = locator<VaccinationService>();

  List<Vaccination> vaccination;

  Future<List<Vaccination>> fetchVaccinationRecords() async {
    var results = await _vaccinationService.getDataCollection();
    vaccination = results.documents
        .map((doc) => Vaccination.fromMap(doc.data, doc.documentID))
        .toList();

    return vaccination;
  }

  Stream<QuerySnapshot> fetchVaccinationRecordAsStream() {
    return _vaccinationService.streamDataCollection();
  }

  Future<Vaccination> getVaccinationRecordById(String id) async {
    var doc = await _vaccinationService.getDocumentById(id);
    return Vaccination.fromMap(doc.data, doc.documentID);
  }

  Future removeVaccinationRecord(String id) async {
    await _vaccinationService.removeDocument(id);
    return;
  }

  Future updateVaccinationRecord(Vaccination data, String id) async {
    await _vaccinationService.updateDocument(data.toJson(), id);
    return;
  }

  Future addVaccinationRecord(Vaccination data) async {
    var result = await _vaccinationService.addDocument(data.toJson());

    return;
  }
}

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
class CRUDArtificialInseminationModel extends ChangeNotifier {
  ArtificialInseminationRecordService _artificialInseminationRecordService =
      locator<ArtificialInseminationRecordService>();

  List<ArtificialInseminationRecord> artificialInseminationRecord;

  Future<List<ArtificialInseminationRecord>>
      fetchArtificialInseminationRecords() async {
    var results =
        await _artificialInseminationRecordService.getDataCollection();
    artificialInseminationRecord = results.documents
        .map((doc) =>
            ArtificialInseminationRecord.fromMap(doc.data, doc.documentID))
        .toList();

    return artificialInseminationRecord;
  }

  Stream<QuerySnapshot> fetchArtificialInseminationRecordAsStream() {
    return _artificialInseminationRecordService.streamDataCollection();
  }

  Future<ArtificialInseminationRecord> getArtificialInseminationRecordById(
      String id) async {
    var doc = await _artificialInseminationRecordService.getDocumentById(id);
    return ArtificialInseminationRecord.fromMap(doc.data, doc.documentID);
  }

  Future removeArtificialInseminationRecordRecord(String id) async {
    await _artificialInseminationRecordService.removeDocument(id);
    return;
  }

  Future updateArtificialInseminationRecordRecord(
      ArtificialInseminationRecord data, String id) async {
    await _artificialInseminationRecordService.updateDocument(
        data.toJson(), id);
    return;
  }

  Future addArtificialInseminationRecordRecord(
      ArtificialInseminationRecord data) async {
    var result =
        await _artificialInseminationRecordService.addDocument(data.toJson());

    return;
  }
}
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

class CRUDUserFarmerModel extends ChangeNotifier {
  UserFarmerService _userFarmerService = locator<UserFarmerService>();

  List<UserFarmer> userFarmer;

  Future<List<UserFarmer>> fetchUserFarmerRecords() async {
    var results = await _userFarmerService.getDataCollection();
    userFarmer = results.documents
        .map((doc) => UserFarmer.fromMap(doc.data, doc.documentID))
        .toList();

    return userFarmer;
  }

  Stream<QuerySnapshot> fetchUserFarmerRecordAsStream() {
    return _userFarmerService.streamDataCollection();
  }

  Future<UserFarmer> getUserFarmerRecordById(String id) async {
    var doc = await _userFarmerService.getDocumentById(id);
    return UserFarmer.fromMap(doc.data, doc.documentID);
  }

  Future removeUserFarmerRecord(String id) async {
    await _userFarmerService.removeDocument(id);
    return;
  }

  Future updateUserFarmerRecord(UserFarmer data, String id) async {
    await _userFarmerService.updateDocument(data.toJson(), id);
    return;
  }

  Future addUserFarmerRecord(UserFarmer data) async {
    var result = await _userFarmerService.addDocument(data.toJson());

    return;
  }
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
class CRUDDewormModel extends ChangeNotifier {
  DewormService _dewormService = locator<DewormService>();

  List<Deworm> deworm;

  Future<List<Deworm>> fetchDewormRecords() async {
    var results = await _dewormService.getDataCollection();
    deworm = results.documents
        .map((doc) => Deworm.fromMap(doc.data, doc.documentID))
        .toList();

    return deworm;
  }

  Stream<QuerySnapshot> fetchDewormRecordAsStream() {
    return _dewormService.streamDataCollection();
  }

  Future<Deworm> getDewormRecordById(String id) async {
    var doc = await _dewormService.getDocumentById(id);
    return Deworm.fromMap(doc.data, doc.documentID);
  }

  Future removeDewormRecord(String id) async {
    await _dewormService.removeDocument(id);
    return;
  }

  Future updateDewormRecord(Deworm data, String id) async {
    await _dewormService.updateDocument(data.toJson(), id);
    return;
  }

  Future addDewormRecord(Deworm data) async {
    var result = await _dewormService.addDocument(data.toJson());

    return;
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class CRUDPoultryModel extends ChangeNotifier {
  PoultryService _poultryService = locator<PoultryService>();

  List<Poultry> poultry;

  Future<List<Poultry>> fetchPoultryRecords() async {
    var results = await _poultryService.getDataCollection();
    poultry = results.documents
        .map((doc) => Poultry.fromMap(doc.data, doc.documentID))
        .toList();

    return poultry;
  }

  Stream<QuerySnapshot> fetchPoultryRecordAsStream() {
    return _poultryService.streamDataCollection();
  }

  Future<Poultry> getPoultryRecordById(String id) async {
    var doc = await _poultryService.getDocumentById(id);
    return Poultry.fromMap(doc.data, doc.documentID);
  }

  Future removePoultryRecord(String id) async {
    await _poultryService.removeDocument(id);
    return;
  }

  Future updatePoultryRecord(Poultry data, String id) async {
    await _poultryService.updateDocument(data.toJson(), id);
    return;
  }

  Future addPoultryRecord(Poultry data) async {
    var result = await _poultryService.addDocument(data.toJson());

    return;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class CRUDGoatModel extends ChangeNotifier {
  GoatService _goatService = locator<GoatService>();

  List<Goat> goat;

  Future<List<Goat>> fetchGoatRecords() async {
    var results = await _goatService.getDataCollection();
    goat = results.documents
        .map((doc) => Goat.fromMap(doc.data, doc.documentID))
        .toList();

    return goat;
  }

  Stream<QuerySnapshot> fetchGoatRecordAsStream() {
    return _goatService.streamDataCollection();
  }

  Future<Goat> getGoatRecordById(String id) async {
    var doc = await _goatService.getDocumentById(id);
    return Goat.fromMap(doc.data, doc.documentID);
  }

  Future removeGoatRecord(String id) async {
    await _goatService.removeDocument(id);
    return;
  }

  Future updateGoatRecord(Goat data, String id) async {
    await _goatService.updateDocument(data.toJson(), id);
    return;
  }

  Future addGoatRecord(Goat data) async {
    var result = await _goatService.addDocument(data.toJson());

    return;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class CRUDSheepModel extends ChangeNotifier {
  SheepService _sheepService = locator<SheepService>();

  List<Sheep> sheep;

  Future<List<Sheep>> fetchSheepRecords() async {
    var results = await _sheepService.getDataCollection();
    sheep = results.documents
        .map((doc) => Sheep.fromMap(doc.data, doc.documentID))
        .toList();

    return sheep;
  }

  Stream<QuerySnapshot> fetchSheepRecordAsStream() {
    return _sheepService.streamDataCollection();
  }

  Future<Sheep> getSheepRecordById(String id) async {
    var doc = await _sheepService.getDocumentById(id);
    return Sheep.fromMap(doc.data, doc.documentID);
  }

  Future removeSheepRecord(String id) async {
    await _sheepService.removeDocument(id);
    return;
  }

  Future updateSheepRecord(Sheep data, String id) async {
    await _sheepService.updateDocument(data.toJson(), id);
    return;
  }

  Future addSheepRecord(Sheep data) async {
    var result = await _sheepService.addDocument(data.toJson());

    return;
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class CRUDHorseModel extends ChangeNotifier {
  HorseService _horseService = locator<HorseService>();

  List<Horse> horse;

  Future<List<Horse>> fetchSheepRecords() async {
    var results = await _horseService.getDataCollection();
    horse = results.documents
        .map((doc) => Horse.fromMap(doc.data, doc.documentID))
        .toList();

    return horse;
  }

  Stream<QuerySnapshot> fetchHorseRecordAsStream() {
    return _horseService.streamDataCollection();
  }

  Future<Horse> getHorseRecordById(String id) async {
    var doc = await _horseService.getDocumentById(id);
    return Horse.fromMap(doc.data, doc.documentID);
  }

  Future removeHorseRecord(String id) async {
    await _horseService.removeDocument(id);
    return;
  }

  Future updateHorseRecord(Horse data, String id) async {
    await _horseService.updateDocument(data.toJson(), id);
    return;
  }

  Future addHorseRecord(Horse data) async {
    var result = await _horseService.addDocument(data.toJson());

    return;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


class CRUDDonkeyModel extends ChangeNotifier {
  DonkeyService _donkeyService = locator<DonkeyService>();

  List<Donkey> donkey;

  Future<List<Donkey>> fetchSheepRecords() async {
    var results = await _donkeyService.getDataCollection();
    donkey = results.documents
        .map((doc) => Donkey.fromMap(doc.data, doc.documentID))
        .toList();

    return donkey;
  }

  Stream<QuerySnapshot> fetchDonkeyRecordAsStream() {
    return _donkeyService.streamDataCollection();
  }

  Future<Donkey> getDonkeyRecordById(String id) async {
    var doc = await _donkeyService.getDocumentById(id);
    return Donkey.fromMap(doc.data, doc.documentID);
  }

  Future removeDonkeyRecord(String id) async {
    await _donkeyService.removeDocument(id);
    return;
  }

  Future updateDonkeyRecord(Donkey data, String id) async {
    await _donkeyService.updateDocument(data.toJson(), id);
    return;
  }

  Future addDonkeyRecord(Donkey data) async {
    var result = await _donkeyService.addDocument(data.toJson());

    return;
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


class CRUDDogModel extends ChangeNotifier {
  DogService _dogService = locator<DogService>();

  List<Dog> dog;

  Future<List<Dog>> fetchDogRecords() async {
    var results = await _dogService.getDataCollection();
    dog = results.documents
        .map((doc) => Dog.fromMap(doc.data, doc.documentID))
        .toList();

    return dog;
  }

  Stream<QuerySnapshot> fetchDogRecordAsStream() {
    return _dogService.streamDataCollection();
  }

  Future<Dog> getDogRecordById(String id) async {
    var doc = await _dogService.getDocumentById(id);
    return Dog.fromMap(doc.data, doc.documentID);
  }

  Future removeDogRecord(String id) async {
    await _dogService.removeDocument(id);
    return;
  }

  Future updateDogRecord(Dog data, String id) async {
    await _dogService.updateDocument(data.toJson(), id);
    return;
  }

  Future addDogRecord(Dog data) async {
    var result = await _dogService.addDocument(data.toJson());

    return;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class CRUDCattleModel extends ChangeNotifier {
  CattleService _cattleService = locator<CattleService>();

  List<Cattle> cattle;

  Future<List<Cattle>> fetchCattleRecords() async {
    var results = await _cattleService.getDataCollection();
    cattle = results.documents
        .map((doc) => Cattle.fromMap(doc.data, doc.documentID))
        .toList();

    return cattle;
  }

  Stream<QuerySnapshot> fetchCattleRecordAsStream() {
    return _cattleService.streamDataCollection();
  }

  Future<Cattle> getCattleRecordById(String id) async {
    var doc = await _cattleService.getDocumentById(id);
    return Cattle.fromMap(doc.data, doc.documentID);
  }

  Future removeCattleRecord(String id) async {
    await _cattleService.removeDocument(id);
    return;
  }

  Future updateCattleRecord(Cattle data, String id) async {
    await _cattleService.updateDocument(data.toJson(), id);
    return;
  }

  Future addCattleRecord(Cattle data) async {
    var result = await _cattleService.addDocument(data.toJson());

    return;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


















