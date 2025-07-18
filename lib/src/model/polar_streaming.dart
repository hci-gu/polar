import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:polar/src/model/convert.dart';
import 'package:polar/src/model/ppg_data_type.dart';

part 'polar_streaming.g.dart';

/// Base class for all streaming data
@JsonSerializable(genericArgumentFactories: true)
class PolarStreamingData<T> {
  /// Samples
  final List<T> samples;

  /// Constructor
  PolarStreamingData({
    required this.samples,
  });

  static PolarStreamingData<T> _fromJson<T>(
    Map<String, dynamic> json,
    dynamic Function(Map<String, dynamic>) fromJsonT,
  ) =>
      _$PolarStreamingDataFromJson(json, (dynamic e) => fromJsonT(e));

  /// Convert from json
  factory PolarStreamingData.fromJson(Map<String, dynamic> json) {
    switch (T) {
      case const (PolarHrSample):
        return _fromJson(json, _$PolarHrSampleFromJson);
      case const (PolarEcgSample):
        return _fromJson(json, _$PolarEcgSampleFromJson);
      case const (PolarAccSample):
        return _fromJson(json, _$PolarAccSampleFromJson);
      case const (PolarGyroSample):
        return _fromJson(json, _$PolarGyroSampleFromJson);
      case const (PolarMagnetometerSample):
        return _fromJson(json, _$PolarMagnetometerSampleFromJson);
      case const (PolarPpiSample):
        return _fromJson(json, _$PolarPpiSampleFromJson);
      case const (PolarTemperatureData):
        return _fromJson(json, _$PolarTemperatureSampleFromJson);
      case const (PolarPressureData):
        return _fromJson(json, _$PolarPressureSampleFromJson);
      case const (PolarLocationData):
        return _fromJson(json, _$PolarLocationDataSampleFromJson);
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  Map<String, dynamic> _toJson(Function toJsonT) =>
      _$PolarStreamingDataToJson(this, (dynamic e) => toJsonT(e));

  /// Convert to json
  Map<String, dynamic> toJson() {
    switch (T) {
      case const (PolarHrSample):
        return _toJson(_$PolarHrSampleToJson);
      case const (PolarEcgSample):
        return _toJson(_$PolarEcgSampleToJson);
      case const (PolarAccSample):
        return _toJson(_$PolarAccSampleToJson);
      case const (PolarGyroSample):
        return _toJson(_$PolarGyroSampleToJson);
      case const (PolarMagnetometerSample):
        return _toJson(_$PolarMagnetometerSampleToJson);
      case const (PolarPpiSample):
        return _toJson(_$PolarPpiSampleToJson);
      case const (PolarTemperatureData):
        return _toJson(_$PolarTemperatureSampleToJson);
      case const (PolarPressureData):
        return _toJson(_$PolarPressureSampleToJson);
      case const (PolarLocationData):
        return _toJson(_$PolarLocationDataSampleToJson);
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }
}

/// Polar HR sample
@JsonSerializable()
class PolarHrSample {
  /// hr in BPM
  final int hr;

  /// corrected hr in BPM
  final int correctedHr;

  /// ppg quality
  final int ppgQuality;

  /// rrs RR interval in ms.
  final List<int> rrsMs;

  /// rr available
  final bool rrAvailable;

  /// contact status between the device and the users skin
  final bool contactStatus;

  /// contactSupported if contact is supported
  final bool contactStatusSupported;

  /// Constructor
  PolarHrSample({
    required this.hr,
    required this.correctedHr,
    required this.ppgQuality,
    required this.rrsMs,
    required this.rrAvailable,
    required this.contactStatus,
    required this.contactStatusSupported,
  });
}

/// Polar HR data
typedef PolarHrData = PolarStreamingData<PolarHrSample>;

/// Polar ecg sample
@JsonSerializable()
class PolarEcgSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// Voltage value in µVolts
  final int voltage;

  /// Constructor
  PolarEcgSample({
    required this.timeStamp,
    required this.voltage,
  });
}

/// Polar ecg data
typedef PolarEcgData = PolarStreamingData<PolarEcgSample>;

/// Polar acc sample
@JsonSerializable()
class PolarAccSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// x axis value in millig (including gravity)
  final int x;

  /// y axis value in millig (including gravity)
  final int y;

  /// z axis value in millig (including gravity)
  final int z;

  /// Constructor
  PolarAccSample({
    required this.timeStamp,
    required this.x,
    required this.y,
    required this.z,
  });

  /// From json
  factory PolarAccSample.fromJson(Map<String, dynamic> json) =>
      _$PolarAccSampleFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$PolarAccSampleToJson(this);
}

/// Polar acc data
typedef PolarAccData = PolarStreamingData<PolarAccSample>;

/// Polar gyro sample
@JsonSerializable()
class PolarGyroSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// x axis value in deg/sec
  final double x;

  /// y axis value in deg/sec
  final double y;

  /// z axis value in deg/sec
  final double z;

  /// Constructor
  PolarGyroSample({
    required this.timeStamp,
    required this.x,
    required this.y,
    required this.z,
  });
}

/// Polar gyro data
typedef PolarGyroData = PolarStreamingData<PolarGyroSample>;

/// Polar magnetometer sample
@JsonSerializable()
class PolarMagnetometerSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// x axis value in Gauss
  final double x;

  /// y axis value in Gauss
  final double y;

  /// z axis value in Gauss
  final double z;

  /// Constructor
  PolarMagnetometerSample({
    required this.timeStamp,
    required this.x,
    required this.y,
    required this.z,
  });
}

/// Polar magnetometer data
typedef PolarMagnetometerData = PolarStreamingData<PolarMagnetometerSample>;

/// Polar ohr sample
@JsonSerializable()
class PolarPpgSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// The PPG (Photoplethysmography) raw value received from the optical sensor.
  /// Based on [PpgDataType] the amount of channels varies. Typically ppg(n)
  /// channel + n ambient(s).
  final List<int> channelSamples;

  /// Constructor
  PolarPpgSample({
    required this.timeStamp,
    required this.channelSamples,
  });

  /// From json
  factory PolarPpgSample.fromJson(Map<String, dynamic> json) =>
      _$PolarPpgSampleFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$PolarPpgSampleToJson(this);
}

/// Polar ppg data
@JsonSerializable()
class PolarPpgData extends PolarStreamingData<PolarPpgSample> {
  /// Type of data, which varies based on what is type of optical sensor used
  /// in the device
  @PpgDataTypeConverter()
  final PpgDataType type;

  /// Constructor
  PolarPpgData({
    required this.type,
    required super.samples,
  });

  /// From json
  factory PolarPpgData.fromJson(Map<String, dynamic> json) =>
      _$PolarPpgDataFromJson(json);

  /// To json
  @override
  Map<String, dynamic> toJson() => _$PolarPpgDataToJson(this);
}

/// PPI measurements provide detailed information about heart rate variability
/// and the quality of the measurements.
@JsonSerializable()
class PolarPpiSample {
  /// Moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// Pulse to Pulse interval in milliseconds.
  ///
  /// The value indicates the quality of PP-intervals:
  /// - Values with error estimate below 10ms are likely very accurate
  /// - Error estimates over 30ms may indicate movement artifacts or loose sensor contact
  @JsonKey(readValue: _readPpi)
  final int ppi;

  /// Estimate of the expected absolute error in PP-interval in milliseconds.
  ///
  /// Lower values indicate more accurate measurements:
  /// - < 10ms: Very accurate
  /// - > 30ms: May indicate measurement issues
  @JsonKey(readValue: _readErrorEstimate)
  final int errorEstimate;

  /// Heart rate in beats per minute (BPM).
  ///
  /// This value is calculated from the PPI measurements and represents
  /// the current heart rate at the time of the sample.
  final int hr;

  /// Indicates if the PP measurement was invalid due to acceleration or other reasons.
  ///
  /// - true: measurement was invalid
  /// - false: measurement was valid
  @PlatformBooleanConverter()
  final bool blockerBit;

  /// Indicates if the device has proper skin contact.
  ///
  /// - true: good skin contact
  /// - false: poor or no skin contact
  @PlatformBooleanConverter()
  final bool skinContactStatus;

  /// Indicates if the device supports the Sensor Contact feature.
  ///
  /// - true: feature is supported
  /// - false: feature is not supported
  @PlatformBooleanConverter()
  final bool skinContactSupported;

  /// Constructor
  PolarPpiSample({
    required this.timeStamp,
    required this.ppi,
    required this.errorEstimate,
    required this.hr,
    required this.blockerBit,
    required this.skinContactStatus,
    required this.skinContactSupported,
  });

  /// From json
  factory PolarPpiSample.fromJson(Map<String, dynamic> json) {
    return PolarPpiSample(
      timeStamp:
          const PolarSampleTimestampConverter().fromJson(json['timeStamp']),
      ppi: _readPpi(json, 'ppi') as int,
      errorEstimate: _readErrorEstimate(json, 'errorEstimate') as int,
      hr: (json['hr'] as num).toInt(),
      blockerBit: const PlatformBooleanConverter().fromJson(json['blockerBit']),
      skinContactStatus:
          const PlatformBooleanConverter().fromJson(json['skinContactStatus']),
      skinContactSupported: const PlatformBooleanConverter()
          .fromJson(json['skinContactSupported']),
    );
  }

  /// To json
  Map<String, dynamic> toJson() => {
        'timeStamp': const PolarSampleTimestampConverter().toJson(timeStamp),
        'ppi': ppi,
        'errorEstimate': errorEstimate,
        'hr': hr,
        'blockerBit': const PlatformBooleanConverter().toJson(blockerBit),
        'skinContactStatus':
            const PlatformBooleanConverter().toJson(skinContactStatus),
        'skinContactSupported':
            const PlatformBooleanConverter().toJson(skinContactSupported),
      };
}

/// Polar ppi data
typedef PolarPpiData = PolarStreamingData<PolarPpiSample>;

/// Polar temperature sample
@JsonSerializable()
class PolarTemperatureSample {
  /// moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// temperature value in celsius
  final double temperature;

  /// Constructor
  PolarTemperatureSample({
    required this.timeStamp,
    required this.temperature,
  });
}

/// Polar temperature data
typedef PolarTemperatureData = PolarStreamingData<PolarTemperatureSample>;

/// Polar pressure sample
@JsonSerializable()
class PolarPressureSample {
  /// moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// pressure value in bar
  final double pressure;

  /// Constructor
  PolarPressureSample({
    required this.timeStamp,
    required this.pressure,
  });
}

/// Polar pressure data
typedef PolarPressureData = PolarStreamingData<PolarPressureSample>;

/// Polar location sample
@JsonSerializable()
class PolarLocationDataSample {
  /// moment sample is taken in nanoseconds. The epoch of timestamp is 1.1.2000
  @PolarSampleTimestampConverter()
  final DateTime timeStamp;

  /// lat value
  final double latitude;

  /// long value
  final double longitude;

  /// time in format "yyyy-MM-dd'T'HH:mm:ss.SSS"
  final String time;

  /// cumulative distance in dm
  final double cumulativeDistance;

  /// speed in km/h
  final double speed;

  /// used acceleration speed
  final double usedAccelerationSpeed;

  /// coordinate speed
  final double coordinateSpeed;

  /// acceleration speed factor
  final double accelerationSpeedFactor;

  /// course in degrees
  final double course;

  /// speed in knots
  final double gpsChipSpeed;

  /// fix
  final bool fix;

  /// speed flag
  final int speedFlag;

  /// fusion state
  final int fusionState;

  /// Constructor
  PolarLocationDataSample({
    required this.timeStamp,
    required this.latitude,
    required this.longitude,
    required this.time,
    required this.cumulativeDistance,
    required this.speed,
    required this.usedAccelerationSpeed,
    required this.coordinateSpeed,
    required this.accelerationSpeedFactor,
    required this.course,
    required this.gpsChipSpeed,
    required this.fix,
    required this.speedFlag,
    required this.fusionState,
  });
}

/// Polar skin temperature data
typedef PolarLocationData = PolarStreamingData<PolarLocationDataSample>;

Object? _readErrorEstimate(Map json, String key) => readPlatformValue(
      json,
      {
        TargetPlatform.iOS: 'ppErrorEstimate',
        TargetPlatform.android: 'errorEstimate',
      },
    );

Object? _readPpi(Map json, String key) => readPlatformValue(
      json,
      {
        TargetPlatform.iOS: 'ppInMs',
        TargetPlatform.android: 'ppi',
      },
    );
