import 'package:socket_io_client/socket_io_client.dart';

void main() {
  final socket = io('http://localhost:3000');

  socket.onConnectError((data) => print(data));

  socket.onConnecting((data) => print(data));

  socket.onConnect((socket) {
    print(socket);

    print('connect');

    socket.emit('message', 'test');
  });

  socket.on('event', (data) => print(data));
  socket.on('connect', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (data) => print(data));
}
