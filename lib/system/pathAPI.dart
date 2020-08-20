final String _base_url = "http://amphawan.cityvariety.co.th/new/";

class PathAPI {
  //Notifications
  String getNotification = _base_url + 'dhamma';

  //ปฏิบัติธรรม
  String getAllDhamma = _base_url + 'dhamma';
  String getDhamma = _base_url + 'dhamma/get/';
  PathAPI() : super();
}
