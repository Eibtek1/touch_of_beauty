
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}


class ChangeServicesInHomeOrInCenter extends ServicesState {}



class GetServicesInHomeOrCenterLoading extends ServicesState {}
class GetServicesInHomeOrCenterSuccess extends ServicesState {}
class GetServicesInHomeOrCenterError extends ServicesState {}
