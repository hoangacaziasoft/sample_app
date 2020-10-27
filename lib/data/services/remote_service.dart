mixin   RemoteService{
  Future<dynamic> getSummaryData();

  Future<dynamic> getCountryData(String countryId);
}