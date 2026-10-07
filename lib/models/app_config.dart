class AppConfig {
  String? BASE_API_URL;
  String? BASE_IMAGE_API_URL;
  String? API_KEY;

  AppConfig({
    required this.BASE_API_URL,
    required this.BASE_IMAGE_API_URL,
    required this.API_KEY,
  });

  AppConfig.formJson(Map<String, dynamic> json) {
    this.BASE_API_URL = json['BASE_API_URL'];
    this.BASE_IMAGE_API_URL = json['BASE_IMAGE_API_URL'];
    this.API_KEY = json['API_KEY'];
  }
}
