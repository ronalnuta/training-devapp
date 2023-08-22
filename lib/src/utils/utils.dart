class UtilsCalendar {
  static String formatDateMessage(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      DateTime now = DateTime.now();

      return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day
          ? date.toString().substring(
                11,
                16,
              )
          : '${date.day} th${date.month}';
    } catch (e) {
      return "";
    }
  }

  static String formatUpdateDateCalendar(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);

      return 'Cập nhật lúc ${date.hour.toString().padLeft(
            2,
            '0',
          )}:${date.minute.toString().padLeft(
            2,
            '0',
          )} Ngày ${date.day.toString().padLeft(
            2,
            '0',
          )}/${date.month.toString().padLeft(
            2,
            '0',
          )}/${date.year.toString().substring(2)}';
    } catch (e) {
      return "";
    }
  }
}
