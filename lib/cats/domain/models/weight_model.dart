enum WeightOptions {imperial, metric}

class WeightModel {
  final String? imperial;
  final String? metric;

  WeightModel({
    this.imperial,
    this.metric,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }
}
