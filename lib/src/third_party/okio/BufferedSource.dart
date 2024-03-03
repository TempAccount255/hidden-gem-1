// Autogenerated by jnigen. DO NOT EDIT!

// ignore_for_file: annotate_overrides
// ignore_for_file: camel_case_extensions
// ignore_for_file: camel_case_types
// ignore_for_file: constant_identifier_names
// ignore_for_file: file_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: overridden_fields
// ignore_for_file: unnecessary_cast
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import "dart:isolate" show ReceivePort;
import "dart:ffi" as ffi;
import "package:jni/internal_helpers_for_jnigen.dart";
import "package:jni/jni.dart" as jni;

/// from: okio.BufferedSource
class BufferedSource extends jni.JObject {
  @override
  late final jni.JObjType<BufferedSource> $type = type;

  BufferedSource.fromRef(
    jni.JObjectPtr ref,
  ) : super.fromRef(ref);

  static final _class = jni.Jni.findJClass(r"okio/BufferedSource");

  /// The type which includes information such as the signature of this class.
  static const type = $BufferedSourceType();
  static final _id_buffer = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"buffer", r"()Lokio/Buffer;");

  /// from: public abstract okio.Buffer buffer()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject buffer() {
    return const jni.JObjectType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_buffer, jni.JniCallType.objectType, []).object);
  }

  static final _id_getBuffer = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"getBuffer", r"()Lokio/Buffer;");

  /// from: public abstract okio.Buffer getBuffer()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getBuffer() {
    return const jni.JObjectType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_getBuffer, jni.JniCallType.objectType, []).object);
  }

  static final _id_exhausted =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"exhausted", r"()Z");

  /// from: public abstract boolean exhausted()
  bool exhausted() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_exhausted, jni.JniCallType.booleanType, []).boolean;
  }

  static final _id_require =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"require", r"(J)V");

  /// from: public abstract void require(long j)
  void require(
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_require, jni.JniCallType.voidType, [j]).check();
  }

  static final _id_request =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"request", r"(J)Z");

  /// from: public abstract boolean request(long j)
  bool request(
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_request, jni.JniCallType.booleanType, [j]).boolean;
  }

  static final _id_readByte =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readByte", r"()B");

  /// from: public abstract byte readByte()
  int readByte() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readByte, jni.JniCallType.byteType, []).byte;
  }

  static final _id_readShort =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readShort", r"()S");

  /// from: public abstract short readShort()
  int readShort() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readShort, jni.JniCallType.shortType, []).short;
  }

  static final _id_readShortLe =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readShortLe", r"()S");

  /// from: public abstract short readShortLe()
  int readShortLe() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readShortLe, jni.JniCallType.shortType, []).short;
  }

  static final _id_readInt =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readInt", r"()I");

  /// from: public abstract int readInt()
  int readInt() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readInt, jni.JniCallType.intType, []).integer;
  }

  static final _id_readIntLe =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readIntLe", r"()I");

  /// from: public abstract int readIntLe()
  int readIntLe() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readIntLe, jni.JniCallType.intType, []).integer;
  }

  static final _id_readLong =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readLong", r"()J");

  /// from: public abstract long readLong()
  int readLong() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readLong, jni.JniCallType.longType, []).long;
  }

  static final _id_readLongLe =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readLongLe", r"()J");

  /// from: public abstract long readLongLe()
  int readLongLe() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readLongLe, jni.JniCallType.longType, []).long;
  }

  static final _id_readDecimalLong = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readDecimalLong", r"()J");

  /// from: public abstract long readDecimalLong()
  int readDecimalLong() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readDecimalLong, jni.JniCallType.longType, []).long;
  }

  static final _id_readHexadecimalUnsignedLong = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readHexadecimalUnsignedLong", r"()J");

  /// from: public abstract long readHexadecimalUnsignedLong()
  int readHexadecimalUnsignedLong() {
    return jni.Jni.accessors.callMethodWithArgs(reference,
        _id_readHexadecimalUnsignedLong, jni.JniCallType.longType, []).long;
  }

  static final _id_skip =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"skip", r"(J)V");

  /// from: public abstract void skip(long j)
  void skip(
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_skip, jni.JniCallType.voidType, [j]).check();
  }

  static final _id_readByteString = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"readByteString", r"()Lokio/ByteString;");

  /// from: public abstract okio.ByteString readByteString()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject readByteString() {
    return const jni.JObjectType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readByteString, jni.JniCallType.objectType, []).object);
  }

  static final _id_readByteString1 = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"readByteString", r"(J)Lokio/ByteString;");

  /// from: public abstract okio.ByteString readByteString(long j)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject readByteString1(
    int j,
  ) {
    return const jni.JObjectType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_readByteString1,
        jni.JniCallType.objectType,
        [j]).object);
  }

  static final _id_select = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"select", r"(Lokio/Options;)I");

  /// from: public abstract int select(okio.Options options)
  int select(
    jni.JObject options,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_select,
        jni.JniCallType.intType, [options.reference]).integer;
  }

  static final _id_readByteArray = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readByteArray", r"()[B");

  /// from: public abstract byte[] readByteArray()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JArray<jni.jbyte> readByteArray() {
    return const jni.JArrayType(jni.jbyteType()).fromRef(jni.Jni.accessors
        .callMethodWithArgs(reference, _id_readByteArray,
            jni.JniCallType.objectType, []).object);
  }

  static final _id_readByteArray1 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readByteArray", r"(J)[B");

  /// from: public abstract byte[] readByteArray(long j)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JArray<jni.jbyte> readByteArray1(
    int j,
  ) {
    return const jni.JArrayType(jni.jbyteType()).fromRef(jni.Jni.accessors
        .callMethodWithArgs(reference, _id_readByteArray1,
            jni.JniCallType.objectType, [j]).object);
  }

  static final _id_read =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"read", r"([B)I");

  /// from: public abstract int read(byte[] bs)
  int read(
    jni.JArray<jni.jbyte> bs,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_read, jni.JniCallType.intType, [bs.reference]).integer;
  }

  static final _id_readFully =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"readFully", r"([B)V");

  /// from: public abstract void readFully(byte[] bs)
  void readFully(
    jni.JArray<jni.jbyte> bs,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_readFully,
        jni.JniCallType.voidType, [bs.reference]).check();
  }

  static final _id_read1 =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"read", r"([BII)I");

  /// from: public abstract int read(byte[] bs, int i, int i1)
  int read1(
    jni.JArray<jni.jbyte> bs,
    int i,
    int i1,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_read1,
        jni.JniCallType.intType,
        [bs.reference, jni.JValueInt(i), jni.JValueInt(i1)]).integer;
  }

  static final _id_readFully1 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readFully", r"(Lokio/Buffer;J)V");

  /// from: public abstract void readFully(okio.Buffer buffer, long j)
  void readFully1(
    jni.JObject buffer,
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_readFully1,
        jni.JniCallType.voidType, [buffer.reference, j]).check();
  }

  static final _id_readAll = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readAll", r"(Lokio/Sink;)J");

  /// from: public abstract long readAll(okio.Sink sink)
  int readAll(
    jni.JObject sink,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_readAll,
        jni.JniCallType.longType, [sink.reference]).long;
  }

  static final _id_readUtf8 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readUtf8", r"()Ljava/lang/String;");

  /// from: public abstract java.lang.String readUtf8()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readUtf8() {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readUtf8, jni.JniCallType.objectType, []).object);
  }

  static final _id_readUtf81 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readUtf8", r"(J)Ljava/lang/String;");

  /// from: public abstract java.lang.String readUtf8(long j)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readUtf81(
    int j,
  ) {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readUtf81, jni.JniCallType.objectType, [j]).object);
  }

  static final _id_readUtf8Line = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"readUtf8Line", r"()Ljava/lang/String;");

  /// from: public abstract java.lang.String readUtf8Line()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readUtf8Line() {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readUtf8Line, jni.JniCallType.objectType, []).object);
  }

  static final _id_readUtf8LineStrict = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"readUtf8LineStrict", r"()Ljava/lang/String;");

  /// from: public abstract java.lang.String readUtf8LineStrict()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readUtf8LineStrict() {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_readUtf8LineStrict,
        jni.JniCallType.objectType, []).object);
  }

  static final _id_readUtf8LineStrict1 = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"readUtf8LineStrict", r"(J)Ljava/lang/String;");

  /// from: public abstract java.lang.String readUtf8LineStrict(long j)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readUtf8LineStrict1(
    int j,
  ) {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_readUtf8LineStrict1,
        jni.JniCallType.objectType,
        [j]).object);
  }

  static final _id_readUtf8CodePoint = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"readUtf8CodePoint", r"()I");

  /// from: public abstract int readUtf8CodePoint()
  int readUtf8CodePoint() {
    return jni.Jni.accessors.callMethodWithArgs(
        reference, _id_readUtf8CodePoint, jni.JniCallType.intType, []).integer;
  }

  static final _id_readString = jni.Jni.accessors.getMethodIDOf(
      _class.reference,
      r"readString",
      r"(Ljava/nio/charset/Charset;)Ljava/lang/String;");

  /// from: public abstract java.lang.String readString(java.nio.charset.Charset charset)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readString(
    jni.JObject charset,
  ) {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_readString,
        jni.JniCallType.objectType,
        [charset.reference]).object);
  }

  static final _id_readString1 = jni.Jni.accessors.getMethodIDOf(
      _class.reference,
      r"readString",
      r"(JLjava/nio/charset/Charset;)Ljava/lang/String;");

  /// from: public abstract java.lang.String readString(long j, java.nio.charset.Charset charset)
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString readString1(
    int j,
    jni.JObject charset,
  ) {
    return const jni.JStringType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_readString1,
        jni.JniCallType.objectType,
        [j, charset.reference]).object);
  }

  static final _id_indexOf =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"indexOf", r"(B)J");

  /// from: public abstract long indexOf(byte b)
  int indexOf(
    int b,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOf,
        jni.JniCallType.longType, [jni.JValueByte(b)]).long;
  }

  static final _id_indexOf1 =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"indexOf", r"(BJ)J");

  /// from: public abstract long indexOf(byte b, long j)
  int indexOf1(
    int b,
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOf1,
        jni.JniCallType.longType, [jni.JValueByte(b), j]).long;
  }

  static final _id_indexOf2 =
      jni.Jni.accessors.getMethodIDOf(_class.reference, r"indexOf", r"(BJJ)J");

  /// from: public abstract long indexOf(byte b, long j, long j1)
  int indexOf2(
    int b,
    int j,
    int j1,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOf2,
        jni.JniCallType.longType, [jni.JValueByte(b), j, j1]).long;
  }

  static final _id_indexOf3 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"indexOf", r"(Lokio/ByteString;)J");

  /// from: public abstract long indexOf(okio.ByteString byteString)
  int indexOf3(
    jni.JObject byteString,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOf3,
        jni.JniCallType.longType, [byteString.reference]).long;
  }

  static final _id_indexOf4 = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"indexOf", r"(Lokio/ByteString;J)J");

  /// from: public abstract long indexOf(okio.ByteString byteString, long j)
  int indexOf4(
    jni.JObject byteString,
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOf4,
        jni.JniCallType.longType, [byteString.reference, j]).long;
  }

  static final _id_indexOfElement = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"indexOfElement", r"(Lokio/ByteString;)J");

  /// from: public abstract long indexOfElement(okio.ByteString byteString)
  int indexOfElement(
    jni.JObject byteString,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOfElement,
        jni.JniCallType.longType, [byteString.reference]).long;
  }

  static final _id_indexOfElement1 = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"indexOfElement", r"(Lokio/ByteString;J)J");

  /// from: public abstract long indexOfElement(okio.ByteString byteString, long j)
  int indexOfElement1(
    jni.JObject byteString,
    int j,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_indexOfElement1,
        jni.JniCallType.longType, [byteString.reference, j]).long;
  }

  static final _id_rangeEquals = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"rangeEquals", r"(JLokio/ByteString;)Z");

  /// from: public abstract boolean rangeEquals(long j, okio.ByteString byteString)
  bool rangeEquals(
    int j,
    jni.JObject byteString,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(reference, _id_rangeEquals,
        jni.JniCallType.booleanType, [j, byteString.reference]).boolean;
  }

  static final _id_rangeEquals1 = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"rangeEquals", r"(JLokio/ByteString;II)Z");

  /// from: public abstract boolean rangeEquals(long j, okio.ByteString byteString, int i, int i1)
  bool rangeEquals1(
    int j,
    jni.JObject byteString,
    int i,
    int i1,
  ) {
    return jni.Jni.accessors.callMethodWithArgs(
        reference,
        _id_rangeEquals1,
        jni.JniCallType.booleanType,
        [j, byteString.reference, jni.JValueInt(i), jni.JValueInt(i1)]).boolean;
  }

  static final _id_peek = jni.Jni.accessors
      .getMethodIDOf(_class.reference, r"peek", r"()Lokio/BufferedSource;");

  /// from: public abstract okio.BufferedSource peek()
  /// The returned object must be released after use, by calling the [release] method.
  BufferedSource peek() {
    return const $BufferedSourceType().fromRef(jni.Jni.accessors
        .callMethodWithArgs(
            reference, _id_peek, jni.JniCallType.objectType, []).object);
  }

  static final _id_inputStream = jni.Jni.accessors.getMethodIDOf(
      _class.reference, r"inputStream", r"()Ljava/io/InputStream;");

  /// from: public abstract java.io.InputStream inputStream()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject inputStream() {
    return const jni.JObjectType().fromRef(jni.Jni.accessors.callMethodWithArgs(
        reference, _id_inputStream, jni.JniCallType.objectType, []).object);
  }
}

final class $BufferedSourceType extends jni.JObjType<BufferedSource> {
  const $BufferedSourceType();

  @override
  String get signature => r"Lokio/BufferedSource;";

  @override
  BufferedSource fromRef(jni.JObjectPtr ref) => BufferedSource.fromRef(ref);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($BufferedSourceType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($BufferedSourceType) &&
        other is $BufferedSourceType;
  }
}
