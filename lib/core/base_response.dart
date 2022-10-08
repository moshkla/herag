mixin BaseResponse<T> {
  bool? status;
  String? message;
  // List<dynamic>? errors;
  // List<T>? data;
  // PaginationInfo? paginationInfo;

  fromJson(Map<String, dynamic> json,
      {T Function(Map<String, dynamic> item)? builder}) {
    status = json['status'];
    message = json['message'];

    // if (json["errors"] != null) {
    //   errors = json["errors"];
    // }

    // if (json['meta'] != null) {
    //   paginationInfo = PaginationInfo.fromJson(json["meta"]);
    // }

    // if (json['data'] is List) {
    //   data = <T>[];
    //   json['data'].forEach((item) {
    //     data?.add(builder!(item));
    //   });
    // }
  }
}

class PaginationInfo {
  int? currentPage;
  int? from;
  int? lastPage;

  PaginationInfo({this.currentPage, this.from, this.lastPage});

  PaginationInfo.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
  }
}

class BaseResponseModel with BaseResponse {
  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
  }
}
