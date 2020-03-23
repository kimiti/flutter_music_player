import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class PermissionsBloc {
  BehaviorSubject<PermissionStatus> _storagePermissionStatus$;

  BehaviorSubject<PermissionStatus> get storagePermissionStatus$ =>
      _storagePermissionStatus$;

  PermissionsBloc() {
    _storagePermissionStatus$ = BehaviorSubject<PermissionStatus>();
  }
}
