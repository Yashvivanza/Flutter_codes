import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Permission Handler Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PermissionHandlerWidget(),
    );
  }
}

class PermissionHandlerWidget extends StatefulWidget {
  const PermissionHandlerWidget({super.key});

  @override
  State<PermissionHandlerWidget> createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Permission Handler"),
      centerTitle: true,
    ),
      body: ListView(
        children: Permission.values
            .where((permission) {
              if (Platform.isIOS) {
                return permission != Permission.unknown;
              } else {
                return permission != Permission.unknown;
              }
            })
            .map((permission) => PermissionWidget(permission))
            .toList(),
      ),
    );
  }
}

class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this.permission, {super.key});

  final Permission permission;

  @override
  State<PermissionWidget> createState() => _PermissionState();
}

class _PermissionState extends State<PermissionWidget> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  Future<void> _listenForPermissionStatus() async {
    final status = await widget.permission.status;

    if (mounted) {
      setState(() {
        _permissionStatus = status;
      });
    }
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      case PermissionStatus.permanentlyDenied:
        return Colors.deepOrange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: ListTile(
      title: Text(
        widget.permission
            .toString()
            .split('.')
            .last
            .replaceAllMapped(
              RegExp(r'([A-Z])'),
              (match) => ' ${match.group(0)}',
            ),
      ),

      subtitle: Text(
        _permissionStatus.toString().split('.').last,
        style: TextStyle(
          color: getPermissionColor(),
          fontWeight: FontWeight.bold,
        ),
      ),

      trailing: IconButton(
        icon: const Icon(Icons.info),
        onPressed: () async {
          if (widget.permission is PermissionWithService) {
            final serviceStatus =
                await (widget.permission as PermissionWithService)
                    .serviceStatus;

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Service Status: $serviceStatus',
                  ),
                ),
              );
            }
          }
        },
      ),

      onTap: () async {
        Permission permission = widget.permission;

        // Special permissions
        if (permission == Permission.manageExternalStorage ||
            permission == Permission.systemAlertWindow ||
            permission == Permission.requestInstallPackages ||
            permission == Permission.scheduleExactAlarm ||
            permission == Permission.accessNotificationPolicy ||
            permission == Permission.ignoreBatteryOptimizations) {

          await openAppSettings();

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${permission.toString().split('.').last} requires Settings access",
                ),
              ),
            );
          }

          await _listenForPermissionStatus();
          return;
        }

        final status = await permission.request();

        if (!mounted) return;

        setState(() {
          _permissionStatus = status;
        });

        String message = "";

        switch (status) {
          case PermissionStatus.granted:
            message = "Permission Granted";
            break;

          case PermissionStatus.denied:
            message = "Permission Denied";
            break;

          case PermissionStatus.permanentlyDenied:
            message = "Permission Permanently Denied";
            await openAppSettings();
            break;

          case PermissionStatus.restricted:
            message = "Permission Restricted";
            break;

          case PermissionStatus.limited:
            message = "Permission Limited";
            break;

          case PermissionStatus.provisional:
            message = "Permission Provisional";
            break;
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      },
    )
    );
  }
}