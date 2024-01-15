import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';

class EncryptionHelper {
  //Decrypt the base 16 string to a string
  static Future<String> decryptKey(String cipher) async {
    final k = encrypt.Key.fromUtf8('1234567891011123');

    final iv = IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(k));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(cipher), iv: iv);

    return decrypted;
  }

  //Encrypty the user pin

  static Future<String> encryptKey(String pin) async {
    final k = encrypt.Key.fromUtf8('1234567891011123');

    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(k));

    final encrypted = encrypter.encrypt(pin, iv: iv);

    return encrypted.base64;
  }
}
