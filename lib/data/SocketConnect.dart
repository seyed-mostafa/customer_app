import 'dart:io';
//192.168.43.100
 class SocketConnect {

  static final SocketConnect _socketConnect = SocketConnect._internal();
  static var socket = Socket.connect('10.0.2.2', 8080);

  factory SocketConnect() {
    return _socketConnect;
  }

  SocketConnect._internal();
}