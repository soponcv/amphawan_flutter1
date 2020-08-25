final String _base_url = "http://amphawan.cityvariety.co.th/new/";

class PathAPI {
  String base_url = _base_url;
  //Notifications
  String getNotification = _base_url + 'dhamma';

  //Banner
  String getBanner = _base_url + 'banner';

  //ข้อความวิ่ง
  String getMessage = _base_url + 'welcomemessage';

  //ปฏิบัติธรรม
  String getAllDhamma = _base_url + 'dhamma';
  String getDhamma = _base_url + 'dhamma/get/';

  //กิจกรรมบุญ
  String getEvent = _base_url + 'event';
  String getEventImage = _base_url + 'event/get/';

  //สมัครสมาชิก
  String getMember = _base_url + 'member';
  String postMember = _base_url + 'member/post';
  String updateMember = _base_url + 'member/update/';

  PathAPI() : super();
}
