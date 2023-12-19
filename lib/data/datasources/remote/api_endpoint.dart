class APIEndpoint {
  static const String BASE_URL = BASE_URL_V2;
  static const String BASE_URL_V1 = 'https://api.github.com';
  static const String BASE_URL_V2 = 'https://api.github.com';

  static const String LOGIN = '/login';
  static const String SIGN_UP = '/sign-up';
  static const String CHECK_EMAIL_EXIST = '/check-email-exist';
  static const String CHECK_PHONE_EXIST = '/check-phone-exist';
  static const String FORGOT_PASSWORD_SEND_EMAIL = '/forgot-password-send-email';
  static const String FORGOT_PASSWORD_VERIFY_CODE = '/forgot-password-verify-code';
  static const String SET_NEW_PASSWORD = '/set-new-password';
  static const String LOGOUT = '/logout';
  static const String CURRENT_USER = '/current-user';
  static const String DELETE_USER = '/delete-user';
  static const String SOCIAL_LOGIN = '/social-login';
  static const String SOCIAL_LOGIN_GOOGLE = '/social-login-google';
  static const String SOCIAL_LOGIN_FACEBOOK = '/social-login-facebook';
  static const String SOCIAL_LOGIN_APPLE = '/social-login-apple';
  static const String SOCIAL_LOGIN_TWITTER = '/social-login-twitter';
  static const String GET_PROFILE = '/get-profile';
  static const String UPDATE_PROFILE = '/update-profile';


}
