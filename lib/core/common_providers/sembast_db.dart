import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

part 'sembast_db.g.dart';

/// Sembast Database is created using a `future provider`.
@Riverpod(keepAlive: true)
Future<Database> sembastDatabase(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  final dbPath = join(dir.path, 'todo.db');
  return await databaseFactoryIo.openDatabase(dbPath);
}
