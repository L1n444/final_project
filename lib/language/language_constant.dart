List<Language> langList = [
  Khmer(),
  Language(),
];

class Language{
  String get systemMode => "System Mode";
  String get darkMode => "Dark Mode";
  String get lightMode => "Light Mode";
  String get language => "Language";
  String get toKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get toEnglish => "Change To English";
  String get appName => "Game of Thrones";
  String get firstName => "First Name";
  String get lastName => "Last Name";
  String get fullName => "Full Name";
  String get title => "Title";
  String get family => "Family";
  String get search => "Search Characters";
  String get searchHint => "Search...";
  String get bodyMessage => "Type in the search bar";
  String get errorMessage => "No characters found";
  String get aboutUs => "About Us";
  String get teamMembers => "Team Members";
}

class Khmer implements Language{
  @override
  String get systemMode => "ប្តូរពន្លឺតាមប្រព័ន្ធ";
  @override
  String get darkMode => "ប្តូរទៅងងឹត";
  @override
  String get lightMode => "ប្តូរទៅភ្លឺ";
  @override
  String get language => "ភាសា";
  @override
  String get toKhmer => "ប្តូរទៅភាសាខ្មែរ";
  @override
  String get toEnglish => "Change To English";
  @override
  String get appName => "ល្បែងនៃបល្ល័ង្ក";
  @override
  String get firstName => "នាមខ្លួន";
  @override
  String get lastName => "នាមត្រកូល";
  @override
  String get fullName => "ឈ្មោះពេញ";
  @override
  String get title => "ងារ";
  @override
  String get family => "គ្រួសារ";
  @override
  String get search => "ស្វែងរកតួអង្គ";
  @override
  String get searchHint => "ស្វែងរក...";
  @override
  String get bodyMessage => "វាយបញ្ចូលក្នុងរបារស្វែងរក";
  @override
  String get errorMessage => "រកមិនឃើញតួអង្គ";
  @override
  String get aboutUs => "អំពីពួកយើង";
  @override
  String get teamMembers => "សមាជិកក្រុម";
}