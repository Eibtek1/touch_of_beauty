class EndPoints{
  static const baseUrl = 'https://eibtek2-001-site5.atempurl.com/api';
  static const imageBaseUrl = 'https://eibtek2-001-site5.atempurl.com';
  static const userRegister = '/Users/UserRegister';
  static const centerRegister = '/Users/CenterRegister';
  static const updateCenterProfile = '/Users/UpdateCenterProfile';
  static const updateUserProfile = '/Users/UpdateUserProfile';
  static const updateFreelancerProfile = '/Users/UpdateFreeAgentProfile';
  static const freelancerRegister = '/Users/FreeAgentRegister';
  static const login = '/Users/login';
  static const logout = '/Users/logout';
  static const changePassword = '/Users/changeoldPassword';
  static const getUserData = '/Users/GetUserInfo';
  static const getAllPicturesForProvider = '/PicturesLibrary/GetAllForProvider';
  static const addPictureToLibrary = '/PicturesLibrary/';
  static const forgetPassword = '/Users/ForgetPassword';
  static const changeConfirmPassword = '/Users/ChangePasswordConfirm';
  static const changeForgetPassword = '/Users/changeForgotPassword';
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
  static const getServiceDetailsById = '/Services/ServiceDetails/';
  static const confirmOrder = '/OrderUsers/ConfirmOrder/';
  static const removeOrder = '/OrderUsers/RemoveOrder/';
  static const preparedOrders = '/OrderProviders/PreparedOrders';
  static const getOrderById = '/OrderProviders/GetOrderById';
  static const editServices = '/Services/UpdateService/';
  static const deleteServices = '/Services/DeleteService/';
  static const contactUs = '/ContactUs/ContactUs';
  static const workHours = '/WorkHours';
  static const getTodayOrders = '/OrderProviders/GetAllOrders';
  static const changeOrderStatus = '/OrderProviders/ChangeOrderStatus';
  static const confirmedOrders = '/OrderProviders/ConfirmedOrders';
  static const withDriverOrders = '/OrderProviders/WithDriverOrders';
  static const finishedOrders = '/OrderProviders/FinishedOrders';
  static const cancelledOrders = '/OrderProviders/CancelledOrders';
  static const addProviderToFavorite = '/Favorites/AddProviderInFavorite/';
  static const deleteProviderFromFavorite = '/Favorites/DeleteProviderFromFavorite/';
  static const addServiceToFavorite = '/Favorites/AddServiceInFavorite/';
  static const getFavoriteProviders = '/Favorites/GetFavoriteProviders';
  static const getFavoriteServices = '/Favorites/GetFavoriteServices';
  static const getQuestions = '/QuestionsAndAnswers/GetAll';
  static const addresses = '/Addresses';
  static const employees = '/Employees';
  static const applePublish = '/ApplePublish';
  static const addOrder = '/OrderUsers/AddOrder';
  static const getOrdersForUser = '/OrderUsers/GetOrders';
  static const deleteServiceFromFavorite = '/Favorites/DeleteServiceFromFavorite/';
  static const getServicesForServicesProvider = '/Services/ServicesForProvider';
  static const addService = '/Services/AddService';
  static const getAllNotifications = '/Notification/GetAllNotifications';
  static const sendNotification = '/Notification/SendNotification';
  static const getServicesByServiceProviderId = '/Services/ServicesByProvider/';
  static const addServiceEvaluations = '/Evaluations/AddServiceEvaluations';
  static const addServiceProviderEvaluations = '/Evaluations/AddProviderEvaluations';
  static String getServicesInHomeOrInCenter({
  required bool inHome,
}){
    return '/Services/ServicesForUser/$inHome/${!inHome}';
  }
}