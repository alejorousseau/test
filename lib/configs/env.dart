enum Environment { production, develop }

class Env {

  static const String _baseUrlDev  = 'https://hn.algolia.com/api/v1';
  static const String _baseUrlProd = 'https://hn.algolia.com/api/v1';

  static String baseUrl({ Environment environment = Environment.develop }) => environment == Environment.develop ? _baseUrlDev : _baseUrlProd;

}