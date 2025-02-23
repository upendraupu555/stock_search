// To parse this JSON data, do
//
//     final getStockByIdModel = getStockByIdModelFromJson(jsonString);

import 'dart:convert';

GetStockByIdModel getStockByIdModelFromJson(String str) => GetStockByIdModel.fromJson(json.decode(str));

String getStockByIdModelToJson(GetStockByIdModel data) => json.encode(data.toJson());

class GetStockByIdModel {
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
  double? price;
  double? changePercent;
  List<dynamic>? holdings;
  List<dynamic>? sectorAllocation;
  num? sustainableInvestmentHoldingPercentage;
  bool? inPortfolio;

  GetStockByIdModel({
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
    this.price,
    this.changePercent,
    this.holdings,
    this.sectorAllocation,
    this.sustainableInvestmentHoldingPercentage,
    this.inPortfolio,
  });

  factory GetStockByIdModel.fromJson(Map<String, dynamic> json) => GetStockByIdModel(
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
    price: json["price"]?.toDouble(),
    changePercent: json["change_percent"]?.toDouble(),
    holdings: json["holdings"] == null ? [] : List<dynamic>.from(json["holdings"]!.map((x) => x)),
    sectorAllocation: json["sector_allocation"] == null ? [] : List<dynamic>.from(json["sector_allocation"]!.map((x) => x)),
    sustainableInvestmentHoldingPercentage: json["sustainable_investment_holding_percentage"],
    inPortfolio: json["in_portfolio"],
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
    "price": price,
    "change_percent": changePercent,
    "holdings": holdings == null ? [] : List<dynamic>.from(holdings!.map((x) => x)),
    "sector_allocation": sectorAllocation == null ? [] : List<dynamic>.from(sectorAllocation!.map((x) => x)),
    "sustainable_investment_holding_percentage": sustainableInvestmentHoldingPercentage,
    "in_portfolio": inPortfolio,
  };
}
