// ignore_for_file: constant_identifier_names

class Constants {
  //TODOS: Global Error API
  static const String COPYRIGHT = '© 2022, PT. Japfa Comfeed Indonesia, Tbk.';
  static const String FILE_TOO_BIG = 'Maaf, file hanya boleh maksimal 5 MB atau HARUS bertipe .pdf .png .jpg .jpeg';
  static const String MORE_THAN_THREE_CHARACTERS = 'Maaf, jumlah karakter harus sama dengan 8 atau lebih.';
  static const String LOGOUT_CONFIRM = 'Anda yakin ingin keluar ?';
  // static const String UNAUTHORIZED = 'KELUAR OTOMATIS KARNA LOGIN PONSEL LAIN ATAU KELUAR PAKSA DARI ADMINISTRATOR';
  static const String UNAUTHORIZED = 'Session Anda sudah berakhir. Silahkan login kembali.';
  //TODOS: Global Messages
  static const String GLB_OTP_SUCCESS_SENT = "OTP berhasil dikirim";
  static const String GLB_OTP_FAILED_SENT = "OTP gagal dikirim";
  //TODOS: Constants for ACTIVATION PROCESS
  static const String INTERNAL_SERVER_ERROR = "Maaf, terdapat kesalahan dari server. Silahkan coba beberapa saat lagi.";
  static const String NO_INTERNET =
      "Silahkan periksa sambungan internet pada ponsel Anda. Aplikasi dapat digunakan setelah Anda terhubung dengan internet.";
  static const String SERVER_TIMEOUT =
      "Maaf, saat ini server sedang terdapat gangguan. Silahkan membuka aplikasi beberapa saat lagi.";
  static const String INVALID_USERNAME =
      "Maaf, username atau NIK tidak ditemukan. Silahkan pastikan kembali username atau NIK yang Anda inputkan benar.";
  static const String BACK_TO_LOGIN = "Apakah Anda yakin ingin kembali ke halaman Login?";
  static const String OTHERS_OTP_CONFIRM =
      "Anda akan menerima kode Verifikasi (OTP) melalui WhatsApp atau email yang terdaftar di ESS.";
  static const String OTP_OPTIONS = "Pilih salah satu metode dibawah ini untuk mengirimkan kode verifikasi (OTP)";
  static const String OTP_OPTIONS_FOOTER =
      "Silahkan menghubungi admin HR masing-masing divisi untuk memperbaharui data jika Nomor Ponsel atau Email tidak sesuai.";
  static const String PIN_NOT_MATCH =
      "PIN Anda tidak cocok dengan PIN sebelumnya. Pastikan PIN Anda sama dengan PIN yang Anda masukkan sebelumnya.";
  static const String WRONG_PIN_SERVER =
      "Silahkan masukkan PIN yang benar. Jika Anda tidak ingat PIN Anda, silahkan pilih tombol \"Lupa PIN ?\".";
  static const String WRONG_PIN_RESET = "Kami akan mereset PIN lama Anda. Apakah Anda yakin?";

  //TODOS: Constants for Main Page
  static const String BACK_TO_HOMEPAGE = "Apakah Anda yakin ingin kembali ke halaman utama?";
  static const String PIN_CREATE_FAILED = "PIN number is in blacklist, please use another combination.";
  static const String BLACKLIST_PIN_MESSAGE = "*PIN ditolak: 1234, 4321, 0000, 1111, 5555, 2580, 0852";

  //TODOS: RESERVATION
  static const String REQUIRED_BEFORE_OPEN_CALENDAR = "Silahkan pilih Kota Asal dan Kota Tujuan terlebih dahulu";
  static const String CONFIRMATION_AGREEMENT_RESERVATION =
      "Tiket yang sudah dipesan hanya bisa dibatalkan dengan alasan \"Force Majeure\". Pembatalan tiket atau ketidakhadiran karena alasan yang tidak jelas akan diberikan sanksi/penalti.";

  //TODOS: Constants for Login Page
  static const String CHANGE_NUMBER_PASSENGER =
      "Anda sudah memilih tanggal pergi dan atau tanggal pulang.\nMerubah jumlah penumpang akan mengharuskan Anda memilih kembali tanggal pergi dan atau pulang.\nPilih ulang?";

  //TODOS: Constants for Home Page
  static const String CHOOSE_FROM_TO_DESTINATION = "'Silahkan pilih Kota Asal dan Kota Tujuan terlebih dahulu'";
  //TODOS: Constants for Visitors
  static const String NO_SEARCH_OR_FILTER = "Tidak ada data dengan kata kunci/ filter yang dipilih";
  static const String INVALID_OTP =
      "Maaf, kode OTP yang Anda masukkan tidak sesuai dengan yang Kami kirim. Silahkan coba kembali.";
}
