import 'dart:io';

import 'package:coffee_server/helper.dart';
import 'package:coffee_server/rest_api.dart';
import 'package:coffee_server/ws_api.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final db = await Db.create('mongodb://admin:pass@localhost:27018/admin');

  await db.open();
  final coll = db.collection('orders');

  const port = 8080;
  final app = Router();

  app.mount('/coffee', RestApi().router);
  app.mount('/coffee-ws', OrdersSocketApi(coll).router);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(handleCors())
      .addHandler(app);

  withHotreload(() => serve(handler, InternetAddress.anyIPv4, port));
}
