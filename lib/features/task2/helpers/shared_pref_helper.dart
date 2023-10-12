import 'package:shared_preferences/shared_preferences.dart';

import '../modal/pet_modal.dart';
import 'shared_pref_keys.dart';

class SharedPrefHelper {
  static Future<PetModal> getPet() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String? name = sharedPreferences.getString(SharedPrefKeys.name);
    final String? type = sharedPreferences.getString(SharedPrefKeys.type);
    final String? breed = sharedPreferences.getString(SharedPrefKeys.breed);
    final String? dob = sharedPreferences.getString(SharedPrefKeys.birthDate);
    final String? gender = sharedPreferences.getString(SharedPrefKeys.gender);
    final String? weight = sharedPreferences.getString(SharedPrefKeys.weight);
    final String? image = sharedPreferences.getString(SharedPrefKeys.image);
    final String? desc =
        sharedPreferences.getString(SharedPrefKeys.description);

    final PetModal petModal = PetModal(
        breed: breed,
        description: desc,
        dob: dob,
        gender: gender,
        image: image,
        name: name,
        type: type,
        weight: weight);

    return petModal;
  }

  static Future<void> setPet(PetModal petModal) async {
    final PetModal storedPet = await getPet();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setString(
        SharedPrefKeys.name, petModal.name ?? storedPet.name ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.type, petModal.type ?? storedPet.type ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.breed, petModal.breed ?? storedPet.breed ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.birthDate, petModal.dob ?? storedPet.dob ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.gender, petModal.gender ?? storedPet.gender ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.weight, petModal.weight ?? storedPet.weight ?? "");
    await sharedPreferences.setString(
        SharedPrefKeys.image, petModal.image ?? storedPet.image ?? "");

    await sharedPreferences.setString(SharedPrefKeys.description,
        petModal.description ?? storedPet.description ?? "");
  }
}
