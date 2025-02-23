// To parse this JSON data, do
//
//     final searchStocksModel = searchStocksModelFromJson(jsonString);

import 'dart:convert';

List<SearchStocksModel> searchStocksModelFromJson(String str) => List<SearchStocksModel>.from(json.decode(str).map((x) => SearchStocksModel.fromJson(x)));

String searchStocksModelToJson(List<SearchStocksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchStocksModel {
  num? id;
  String? name;
  String? symbol;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? alpacaId;
  String? exchange;
  String? description;
  String? assetType;
  String? isin;
  String? industry;
  String? sector;
  num? employees;
  String? website;
  String? address;
  String? netZeroProgress;
  num? carbonnumensityScope3;
  num? carbonnumensityScope1And2;
  num? carbonnumensityScope1And2And3;
  String? tempAlignmentScopes1And2;
  bool? dnshAssessmentPass;
  bool? goodGovernanceAssessment;
  bool? contributeToEnvironmentOrSocialObjective;
  bool? sustainableInvestment;
  num? scope1Emissions;
  num? scope2Emissions;
  num? scope3Emissions;
  num? totalEmissions;
  DateTime? listingDate;
  String? marketCap;
  num? ibkrConnectionId;
  Image? image;
  dynamic createdBy;
  UpdatedBy? updatedBy;

  SearchStocksModel({
    this.id,
    this.name,
    this.symbol,
    this.createdAt,
    this.updatedAt,
    this.alpacaId,
    this.exchange,
    this.description,
    this.assetType,
    this.isin,
    this.industry,
    this.sector,
    this.employees,
    this.website,
    this.address,
    this.netZeroProgress,
    this.carbonnumensityScope3,
    this.carbonnumensityScope1And2,
    this.carbonnumensityScope1And2And3,
    this.tempAlignmentScopes1And2,
    this.dnshAssessmentPass,
    this.goodGovernanceAssessment,
    this.contributeToEnvironmentOrSocialObjective,
    this.sustainableInvestment,
    this.scope1Emissions,
    this.scope2Emissions,
    this.scope3Emissions,
    this.totalEmissions,
    this.listingDate,
    this.marketCap,
    this.ibkrConnectionId,
    this.image,
    this.createdBy,
    this.updatedBy,
  });

  factory SearchStocksModel.fromJson(Map<String, dynamic> json) => SearchStocksModel(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    alpacaId: json["alpaca_id"],
    exchange: json["exchange"],
    description: json["description"],
    assetType: json["asset_type"],
    isin: json["isin"],
    industry: json["industry"],
    sector: json["sector"],
    employees: json["employees"],
    website: json["website"],
    address: json["address"],
    netZeroProgress: json["net_zero_progress"],
    carbonnumensityScope3: json["carbon_numensity_scope_3"],
    carbonnumensityScope1And2: json["carbon_numensity_scope_1_and_2"],
    carbonnumensityScope1And2And3: json["carbon_numensity_scope_1_and_2_and_3"],
    tempAlignmentScopes1And2: json["temp_alignment_scopes_1_and_2"],
    dnshAssessmentPass: json["dnsh_assessment_pass"],
    goodGovernanceAssessment: json["good_governance_assessment"],
    contributeToEnvironmentOrSocialObjective: json["contribute_to_environment_or_social_objective"],
    sustainableInvestment: json["sustainable_investment"],
    scope1Emissions: json["scope_1_emissions"],
    scope2Emissions: json["scope_2_emissions"],
    scope3Emissions: json["scope_3_emissions"],
    totalEmissions: json["total_emissions"],
    listingDate: json["listing_date"] == null ? null : DateTime.parse(json["listing_date"]),
    marketCap: json["market_cap"],
    ibkrConnectionId: json["ibkr_connection_id"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"] == null ? null : UpdatedBy.fromJson(json["updatedBy"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "alpaca_id": alpacaId,
    "exchange": exchange,
    "description": description,
    "asset_type": assetType,
    "isin": isin,
    "industry": industry,
    "sector": sector,
    "employees": employees,
    "website": website,
    "address": address,
    "net_zero_progress": netZeroProgress,
    "carbon_numensity_scope_3": carbonnumensityScope3,
    "carbon_numensity_scope_1_and_2": carbonnumensityScope1And2,
    "carbon_numensity_scope_1_and_2_and_3": carbonnumensityScope1And2And3,
    "temp_alignment_scopes_1_and_2": tempAlignmentScopes1And2,
    "dnsh_assessment_pass": dnshAssessmentPass,
    "good_governance_assessment": goodGovernanceAssessment,
    "contribute_to_environment_or_social_objective": contributeToEnvironmentOrSocialObjective,
    "sustainable_investment": sustainableInvestment,
    "scope_1_emissions": scope1Emissions,
    "scope_2_emissions": scope2Emissions,
    "scope_3_emissions": scope3Emissions,
    "total_emissions": totalEmissions,
    "listing_date": "${listingDate!.year.toString().padLeft(4, '0')}-${listingDate!.month.toString().padLeft(2, '0')}-${listingDate!.day.toString().padLeft(2, '0')}",
    "market_cap": marketCap,
    "ibkr_connection_id": ibkrConnectionId,
    "image": image?.toJson(),
    "createdBy": createdBy,
    "updatedBy": updatedBy?.toJson(),
  };
}

class Image {
  num? id;
  String? name;
  dynamic alternativeText;
  dynamic caption;
  num? width;
  num? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  String? folderPath;
  DateTime? createdAt;
  DateTime? updatedAt;

  Image({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    name: json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    width: json["width"],
    height: json["height"],
    formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
    hash: json["hash"],
    ext: json["ext"],
    mime: json["mime"],
    size: json["size"]?.toDouble(),
    url: json["url"],
    previewUrl: json["previewUrl"],
    provider: json["provider"],
    providerMetadata: json["provider_metadata"],
    folderPath: json["folderPath"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "width": width,
    "height": height,
    "formats": formats?.toJson(),
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": provider,
    "provider_metadata": providerMetadata,
    "folderPath": folderPath,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Formats {
  Thumbnail? thumbnail;

  Formats({
    this.thumbnail,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail?.toJson(),
  };
}

class Thumbnail {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  num? width;
  num? height;
  num? sizeInBytes;

  Thumbnail({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    this.sizeInBytes,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    ext: json["ext"],
    url: json["url"],
    hash: json["hash"],
    mime: json["mime"],
    name: json["name"],
    path: json["path"],
    size: json["size"]?.toDouble(),
    width: json["width"],
    height: json["height"],
    sizeInBytes: json["sizeInBytes"],
  );

  Map<String, dynamic> toJson() => {
    "ext": ext,
    "url": url,
    "hash": hash,
    "mime": mime,
    "name": name,
    "path": path,
    "size": size,
    "width": width,
    "height": height,
    "sizeInBytes": sizeInBytes,
  };
}

class UpdatedBy {
  num? id;
  String? firstname;
  String? lastname;
  dynamic username;
  String? email;
  String? password;
  dynamic resetPasswordToken;
  dynamic registrationToken;
  bool? isActive;
  bool? blocked;
  dynamic preferedLanguage;
  DateTime? createdAt;
  DateTime? updatedAt;

  UpdatedBy({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.password,
    this.resetPasswordToken,
    this.registrationToken,
    this.isActive,
    this.blocked,
    this.preferedLanguage,
    this.createdAt,
    this.updatedAt,
  });

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    resetPasswordToken: json["resetPasswordToken"],
    registrationToken: json["registrationToken"],
    isActive: json["isActive"],
    blocked: json["blocked"],
    preferedLanguage: json["preferedLanguage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
    "email": email,
    "password": password,
    "resetPasswordToken": resetPasswordToken,
    "registrationToken": registrationToken,
    "isActive": isActive,
    "blocked": blocked,
    "preferedLanguage": preferedLanguage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
