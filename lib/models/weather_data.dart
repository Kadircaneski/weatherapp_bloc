import 'package:weatherapp_bloc/models/current.dart';
import 'package:weatherapp_bloc/models/location.dart';

class WeatherModels {
  Location? _location;
  Current? _current;

  WeatherModels({Location? location, Current? current})
      : _current = current,
        _location = location;

  Location? get location => _location;

  Current? get current => _current;

  WeatherModels.fromJson(Map<String, dynamic> json) {
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}