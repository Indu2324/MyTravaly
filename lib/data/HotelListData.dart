class HotelListData {
  bool? status;
  String? message;
  int? responseCode;
  List<Data>? data;

  HotelListData({this.status, this.message, this.responseCode, this.data});

  HotelListData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? propertyName;
  int? propertyStar;
  String? propertyImage;
  String? propertyCode;
  String? propertyType;
  PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities;
  MarkedPrice? markedPrice;
  StaticPrice? staticPrice;
  GoogleReview? googleReview;
  String? propertyUrl;
  PropertyAddress? propertyAddress;

  Data(
      {this.propertyName,
        this.propertyStar,
        this.propertyImage,
        this.propertyCode,
        this.propertyType,
        this.propertyPoliciesAndAmmenities,
        this.markedPrice,
        this.staticPrice,
        this.googleReview,
        this.propertyUrl,
        this.propertyAddress});

  Data.fromJson(Map<String, dynamic> json) {
    propertyName = json['propertyName'];
    propertyStar = json['propertyStar'];
    propertyImage = json['propertyImage'];
    propertyCode = json['propertyCode'];
    propertyType = json['propertyType'];
    propertyPoliciesAndAmmenities =
    json['propertyPoliciesAndAmmenities'] != null
        ? new PropertyPoliciesAndAmmenities.fromJson(
        json['propertyPoliciesAndAmmenities'])
        : null;
    markedPrice = json['markedPrice'] != null
        ? new MarkedPrice.fromJson(json['markedPrice'])
        : null;
    staticPrice = json['staticPrice'] != null
        ? new StaticPrice.fromJson(json['staticPrice'])
        : null;
    googleReview = json['googleReview'] != null
        ? new GoogleReview.fromJson(json['googleReview'])
        : null;
    propertyUrl = json['propertyUrl'];
    propertyAddress = json['propertyAddress'] != null
        ? new PropertyAddress.fromJson(json['propertyAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyName'] = this.propertyName;
    data['propertyStar'] = this.propertyStar;
    data['propertyImage'] = this.propertyImage;
    data['propertyCode'] = this.propertyCode;
    data['propertyType'] = this.propertyType;
    if (this.propertyPoliciesAndAmmenities != null) {
      data['propertyPoliciesAndAmmenities'] =
          this.propertyPoliciesAndAmmenities!.toJson();
    }
    if (this.markedPrice != null) {
      data['markedPrice'] = this.markedPrice!.toJson();
    }
    if (this.staticPrice != null) {
      data['staticPrice'] = this.staticPrice!.toJson();
    }
    if (this.googleReview != null) {
      data['googleReview'] = this.googleReview!.toJson();
    }
    data['propertyUrl'] = this.propertyUrl;
    if (this.propertyAddress != null) {
      data['propertyAddress'] = this.propertyAddress!.toJson();
    }
    return data;
  }

  operator [](int other) {}
}

class PropertyPoliciesAndAmmenities {
  bool? present;
  Data? data;

  PropertyPoliciesAndAmmenities({this.present, this.data});

  PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) {
    present = json['present'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['present'] = this.present;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PolicyData {
  String? cancelPolicy;
  String? refundPolicy;
  String? childPolicy;
  String? damagePolicy;
  String? propertyRestriction;
  bool? petsAllowed;
  bool? coupleFriendly;
  bool? suitableForChildren;
  bool? bachularsAllowed;
  bool? freeWifi;
  bool? freeCancellation;
  bool? payAtHotel;
  bool? payNow;
  String? lastUpdatedOn;

  PolicyData(
      {this.cancelPolicy,
        this.refundPolicy,
        this.childPolicy,
        this.damagePolicy,
        this.propertyRestriction,
        this.petsAllowed,
        this.coupleFriendly,
        this.suitableForChildren,
        this.bachularsAllowed,
        this.freeWifi,
        this.freeCancellation,
        this.payAtHotel,
        this.payNow,
        this.lastUpdatedOn});

  PolicyData.fromJson(Map<String, dynamic> json) {
    cancelPolicy = json['cancelPolicy'];
    refundPolicy = json['refundPolicy'];
    childPolicy = json['childPolicy'];
    damagePolicy = json['damagePolicy'];
    propertyRestriction = json['propertyRestriction'];
    petsAllowed = json['petsAllowed'];
    coupleFriendly = json['coupleFriendly'];
    suitableForChildren = json['suitableForChildren'];
    bachularsAllowed = json['bachularsAllowed'];
    freeWifi = json['freeWifi'];
    freeCancellation = json['freeCancellation'];
    payAtHotel = json['payAtHotel'];
    payNow = json['payNow'];
    lastUpdatedOn = json['lastUpdatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cancelPolicy'] = this.cancelPolicy;
    data['refundPolicy'] = this.refundPolicy;
    data['childPolicy'] = this.childPolicy;
    data['damagePolicy'] = this.damagePolicy;
    data['propertyRestriction'] = this.propertyRestriction;
    data['petsAllowed'] = this.petsAllowed;
    data['coupleFriendly'] = this.coupleFriendly;
    data['suitableForChildren'] = this.suitableForChildren;
    data['bachularsAllowed'] = this.bachularsAllowed;
    data['freeWifi'] = this.freeWifi;
    data['freeCancellation'] = this.freeCancellation;
    data['payAtHotel'] = this.payAtHotel;
    data['payNow'] = this.payNow;
    data['lastUpdatedOn'] = this.lastUpdatedOn;
    return data;
  }
}

class MarkedPrice {
  double? amount;
  String? displayAmount;
  String? currencyAmount;
  String? currencySymbol;

  MarkedPrice(
      {this.amount,
        this.displayAmount,
        this.currencyAmount,
        this.currencySymbol});

  MarkedPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    displayAmount = json['displayAmount'];
    currencyAmount = json['currencyAmount'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['displayAmount'] = this.displayAmount;
    data['currencyAmount'] = this.currencyAmount;
    data['currencySymbol'] = this.currencySymbol;
    return data;
  }
}

class StaticPrice {
  int? amount;
  String? displayAmount;
  String? currencyAmount;
  String? currencySymbol;

  StaticPrice(
      {this.amount,
        this.displayAmount,
        this.currencyAmount,
        this.currencySymbol});

  StaticPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    displayAmount = json['displayAmount'];
    currencyAmount = json['currencyAmount'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['displayAmount'] = this.displayAmount;
    data['currencyAmount'] = this.currencyAmount;
    data['currencySymbol'] = this.currencySymbol;
    return data;
  }
}

class GoogleReview {
  bool? reviewPresent;
  Data? data;

  GoogleReview({this.reviewPresent, this.data});

  GoogleReview.fromJson(Map<String, dynamic> json) {
    reviewPresent = json['reviewPresent'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewPresent'] = this.reviewPresent;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RatingData {
  double? overallRating;
  int? totalUserRating;
  int? withoutDecimal;

  RatingData({this.overallRating, this.totalUserRating, this.withoutDecimal});

  RatingData.fromJson(Map<String, dynamic> json) {
    overallRating = json['overallRating'];
    totalUserRating = json['totalUserRating'];
    withoutDecimal = json['withoutDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overallRating'] = this.overallRating;
    data['totalUserRating'] = this.totalUserRating;
    data['withoutDecimal'] = this.withoutDecimal;
    return data;
  }
}

class PropertyAddress {
  String? street;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? mapAddress;
  double? latitude;
  double? longitude;

  PropertyAddress(
      {this.street,
        this.city,
        this.state,
        this.country,
        this.zipcode,
        this.mapAddress,
        this.latitude,
        this.longitude});

  PropertyAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
    mapAddress = json['map_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zipcode'] = this.zipcode;
    data['map_address'] = this.mapAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
