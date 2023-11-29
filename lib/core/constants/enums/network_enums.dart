enum NetworkEnums {
  login('authentication/login'),
  // introOff('introOff'),
  token('authentication/refresh');

  final String path;
  const NetworkEnums(this.path);
}
