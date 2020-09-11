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
  String getAllMember = _base_url + 'member';
  String getMember = _base_url + 'member/get/';
  String checkPostMember =
      _base_url + 'member/checkPost'; //เช็ค Username ,Passsword
  String postMember = _base_url + 'member/post';
  String updateMember1 = _base_url + 'member/update1/';
  String updateMember2 = _base_url + 'member/update2/';
  String updateMember3 = _base_url + 'member/update3/';

  //ลงทะเบียนปฏิบัติธรรม
  String getAllRegister = _base_url + 'register';
  String postRegister = _base_url + 'register/post';
  String getPerRegister = _base_url + 'register/getPer';

  //ความประทับใจ
  String getAllImpression = _base_url + 'impression';
  String getImpressionImg = _base_url + 'impression/get/';
  String getImpressionComment = _base_url + 'impression/comment/';
  String postComment = _base_url + 'impression/postcomment';

  PathAPI() : super();
}
