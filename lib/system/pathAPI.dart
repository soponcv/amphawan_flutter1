final String _base_url = "http://amphawan.cityvariety.co.th/new/";

class PathAPI {
  //Notifications
  String getNotification = _base_url + 'dhamma';

  //ปฏิบัติธรรม
  String getAllDhamma = _base_url + 'dhamma';
  String getDhamma = _base_url + 'dhamma/get/';

  //สมัครสมาชิก
  String getMember = _base_url + 'member';
  String postMember = _base_url + 'member/post';
  String updateMember = _base_url + 'member/update';

  PathAPI() : super();
}
