import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/scan/cubit/scan_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScanQrBloc(),
      child: BlocBuilder<ScanQrBloc, ScanQrState>(
        builder: (context, _) {
          final bloc = context.read<ScanQrBloc>();

          return Scaffold(
            body: Stack(children: [
              QRView(
                key: bloc.qrKey,
                onQRViewCreated: (p0) => bloc.onQRViewCreated(p0),
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.grey,
                  borderWidth: 12,
                  borderRadius: 5,
                  borderLength: 20,
                  cutOutSize: 250.0.w,
                ),
                onPermissionSet: (ctrl, p) => bloc.onPermissionSet(
                  // context,
                  // ctrl,
                  p,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: MediaQuery.of(context).padding.top + 20.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(40.w, 40.w),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                    ),
                    child: const Icon(Icons.close, color: XColors.primary),
                  ),
                ),
              ),
            ]),
          );
        },
        buildWhen: (p, c) => false,
      ),
    );
  }
}
