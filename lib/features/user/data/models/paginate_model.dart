class PaginateModel {
  int? currentPage;
  int? totalItems;
  int? totalPages;
  dynamic items;

  PaginateModel(
      {this.currentPage, this.totalItems, this.totalPages, this.items});

  PaginateModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    items = json['items'];

  }
}

