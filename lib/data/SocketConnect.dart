import 'dart:io';
//192.168.43.100
class SocketConnect {

  static final SocketConnect _socketConnect = SocketConnect._internal();
  static final socket = Socket.connect('192.168.1.5', 8080);

  factory SocketConnect() {
    return _socketConnect;
  }

  SocketConnect._internal();
}