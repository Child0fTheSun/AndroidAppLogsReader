import 'package:file_picker/file_picker.dart';

/// Service for picking files from the device storage
class FilePickerService {
  /// Picks a `.logcat` file from the device.
  ///
  /// Opens the system file picker to allow the user to select a single file
  /// with the `.logcat` extension.
  ///
  /// Returns the absolute path of the selected file, or `null` if the user
  /// cancelled the operation.
  ///
  /// Throws an [Exception] if the file picking process fails
  Future<String?> pickLogcatFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['logcat'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first.path;
      }

      return null;
    } catch (e) {
      // Log error or rethrow
      throw Exception('Failed to pick file: $e');
    }
  }
}
