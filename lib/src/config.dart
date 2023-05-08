class Environments{
  static const String PRODUCTION = 'prod';
  static const String DEV = 'prod';
}

class ConfigEnvironments{
  static const String _currentEnvironments = Environments.DEV;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'https://newsapi.org/v2/',
    },{
      'env': Environments.PRODUCTION,
      'url': '',
    },
  ];

  static Map<String, String> getEnvironments(){
    return _availableEnvironments.firstWhere(
        (d) => d['env'] == _currentEnvironments,
    );
  }
}