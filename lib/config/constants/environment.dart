
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String hostDB = dotenv.env['TASKDB_HOST'] ?? 'No hay host';

}