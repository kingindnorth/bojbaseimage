import 'dart:convert';
import 'dart:io';

/// Usage:
/// dart run tool/gen_locales.dart ms_MY zh_CN
///
/// Reads assets/locales/en_US.json and creates assets/locales/<locale>.json
/// with the same keys and empty values (""), if the file doesn't exist.
Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Pass locale codes, e.g.: dart run tool/gen_locales.dart ms_MY zh_CN');
    exit(64);
  }

  final enPath = 'assets/locales/en_US.json';
  final enFile = File(enPath);
  if (!enFile.existsSync()) {
    stderr.writeln('Missing $enPath. Create English base first.');
    exit(66);
  }

  final base = json.decode(await enFile.readAsString()) as Map<String, dynamic>;
  final emptyMap = base.map((k, v) => MapEntry(k, v.toString()));

  for (final locale in args) {
    final outPath = 'assets/locales/$locale.json';
    final outFile = File(outPath);
    if (outFile.existsSync()) {
      print('Skip $outPath (already exists)');
      continue;
    }
    await outFile.create(recursive: true);
    await outFile.writeAsString(const JsonEncoder.withIndent('  ').convert(emptyMap));
    print('Created $outPath');
  }

  print('Done. Translate the empty values and restart the app.');
}
