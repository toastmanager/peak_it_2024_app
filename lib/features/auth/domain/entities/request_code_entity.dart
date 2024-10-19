import 'package:equatable/equatable.dart';

class RequestCodeEntity extends Equatable {
  final String phone;

  const RequestCodeEntity({required this.phone});

  @override
  List<Object?> get props => [phone];

  RequestCodeEntity copyWith({String? phone}) {
    return RequestCodeEntity(phone: phone ?? this.phone);
  }

  @override
  String toString() {
    return 'RequestCodeEntity{phone=$phone}';
  }
}
