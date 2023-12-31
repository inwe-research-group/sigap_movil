class ImporteAlumno {
  final String codAlumno;
  final int codPrograma;
  final int codConcepto;
  final int importe;
  final int idTipoRecaudacion;
  final String idMoneda;

  ImporteAlumno(
      {required this.codAlumno,
      required this.codPrograma,
      required this.codConcepto,
      required this.importe,
      required this.idTipoRecaudacion,
      required this.idMoneda});

  factory ImporteAlumno.fromJson(Map<String, dynamic> json) {
    return ImporteAlumno(
      codAlumno: json['cod_alumno'] as String,
      codPrograma: json['cod_programa'] as int,
      codConcepto: json['cod_concepto'] as int,
      importe: json['importe'] as int,
      idTipoRecaudacion: json['id_tipo_recaudacion'] as int,
      idMoneda: json['id_moneda'] as String,
    );
  }
}
