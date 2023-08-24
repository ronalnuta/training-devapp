part of 'scan_bloc.dart';

class ScanQrState extends Equatable {
  final Barcode? barcode;
  const ScanQrState({this.barcode});

  @override
  List<Object?> get props => [
        barcode,
      ];

  ScanQrState copyWith({
    Barcode? barcode,
  }) {
    return ScanQrState(
      barcode: barcode ?? this.barcode,
    );
  }
}
