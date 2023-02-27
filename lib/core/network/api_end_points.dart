class EndPoints{
  static const baseUrl = 'http://lightbulbtech-001-site13.etempurl.com/api';
  static const imageBaseUrl = 'http://lightbulbtech-001-site13.etempurl.com';
  static const userRegister = '/Users/UserRegister';
  static const centerRegister = '/Users/CenterRegister';
  static const updateCenterProfile = '/Users/UpdateCenterProfile';
  static const updateUserProfile = '/Users/UpdateUserProfile';
  static const freelancerRegister = '/Users/FreeAgentRegister';
  static const login = '/Users/login';
  static const logout = '/Users/logout';
  static const changePassword = '/Users/changeoldPassword';
  static const getUserData = '/Users/GetUserInfo';
  static const forgetPassword = '/Users/ForgetPassword';
  static const changeForgetPassword = '/Users/ChangePasswordConfirm';
  static const citiesList = '/Cities';
  static const slidePhotos = '/SlidePhotos';
  static const confirmRegister = '/Users/confirmRegister';
  static const sendComplain = '/Complaints/AddComplaint';
  static const getFeaturedMainSections = '/MainSections/FeaturedMainSections';
  static const getMainSections = '/MainSections/MainSections';
  static const getAllServicesProviders = '/ServiceProvider/GetAll';
  static const getServicesProviderById = '/ServiceProvider/GetById/';
  static const getAllFeaturedServicesProviders = '/ServiceProvider/GetAllFeatured';
  static const getServicesByMainFeatureId = '/Services/ServicesByMainSection/';
  static const getServicesForUser = '/Services/ServicesForUser';
  static const getServicesForServicesProvider = '/Services/ServicesForProvider';
  static const getServicesByServiceProviderId = '/Services/ServicesByProvider/';
  static String getServicesInHomeOrInCenter({
  required bool inHome,
}){
    return '/Services/ServicesForUser/$inHome/${!inHome}';
  }
}