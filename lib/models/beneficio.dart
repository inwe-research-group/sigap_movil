class Beneficio {
  final String codAlumno;
  final int idBeneficio;
  final int benefOtrogado;
  final String benefMax;
  final String tipo;
  final String autorizacion;
  final String resolucion;
  final int idBc;
  final String condicion;
  final String fecha;
  final int idAbp;
  final String criterio;
  final String observacion;

  Beneficio(
      {required this.codAlumno,
      required this.idBeneficio,
      required this.benefOtrogado,
      required this.benefMax,
      required this.tipo,
      required this.autorizacion,
      required this.resolucion,
      required this.idBc,
      required this.condicion,
      required this.fecha,
      required this.idAbp,
      required this.criterio,
      required this.observacion});

  factory Beneficio.fromJson(Map<String, dynamic> json) {
    return Beneficio(
      codAlumno: json['cod_alumno'] as String,
      idBeneficio: json['id_beneficio'] as int,
      benefOtrogado: json['benef_otrogado'] as int,
      benefMax: json['benef_max'] as String,
      tipo: json['tipo'] as String,
      autorizacion: json['autorizacion'] as String,
      resolucion: json['resolucion'] as String,
      idBc: json['id_bc'] as int,
      condicion: json['condicion'] as String,
      fecha: json['fecha'] as String,
      idAbp: json['id_abp'] as int,
      criterio: json['criterio'] as String,
      observacion: json['observacion'] as String,
    );
  }
}
