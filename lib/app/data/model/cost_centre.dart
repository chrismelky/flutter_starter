// To parse this JSON data, do
//
//     final costCentre = costCentreFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CostCentre> costCentreListFromJson(List<dynamic> data) =>
    List<CostCentre>.from(data.map((x) => CostCentre.fromJson(x)));

class CostCentre {
  CostCentre({
    required this.isCurrentBudgetLocked,
    required this.isCurrentBudgetApproved,
    required this.currentBudgetDecisionLevel,
    required this.section,
  });

  bool isCurrentBudgetLocked;
  bool isCurrentBudgetApproved;
  CurrentBudgetDecisionLevel currentBudgetDecisionLevel;
  NamedEntity section;

  factory CostCentre.fromJson(Map<String, dynamic> json) => CostCentre(
        isCurrentBudgetLocked: json["is_current_budget_locked"],
        isCurrentBudgetApproved: json["is_current_budget_approved"],
        currentBudgetDecisionLevel: CurrentBudgetDecisionLevel.fromJson(
            json["current_budget_decision_level"]),
        section: NamedEntity.fromJson(json["section"]),
      );
}

class CurrentBudgetDecisionLevel {
  CurrentBudgetDecisionLevel({
    required this.id,
    required this.name,
    required this.code,
  });

  int id;
  String name;
  String code;

  factory CurrentBudgetDecisionLevel.fromJson(Map<String, dynamic> json) =>
      CurrentBudgetDecisionLevel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );
}

class NamedEntity {
  NamedEntity({
    required this.id,
    required this.name,
    required this.code,
  });

  int id;
  String name;
  String code;

  factory NamedEntity.fromJson(Map<String, dynamic> json) => NamedEntity(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );
}
