import 'hobby.dart';
import 'language.dart';

class User {
  final String userId;
  final String nickname;
  final String profilePicture;
  final String coverPhoto;
  final String aboutMe;
  final List<Hobby> hobbies;
  final List<Language> languages;

  User({
    this.userId,
    this.nickname,
    this.profilePicture,
    this.coverPhoto,
    this.aboutMe,
    this.hobbies,
    this.languages,
  });
}
