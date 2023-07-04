class RecaudacionesAlumno {
  final int rIdTipoRecaudacion;
  final int cIdTipoRecaudacion;
  final String descripcionRecaudacion;
  final int idRec;
  final int idAlum;
  final String apeNom;
  final int ciclo;
  final String concepto;
  final int idconcepto;
  final String numero;
  final String dni;
  final String nombre;
  final String moneda;
  final String moneda2;
  final double importe;
  final double importeTc;
  final String fecha;
  final String anioIngreso;
  final int idPrograma;
  final String nomPrograma;
  final String siglaPrograma;
  final String codAlumno;
  final String? estado;
  final String? descripcionUbi;
  final String descripcionTipo;
  final String estadoCivil;
  final bool validado;
  final String repitencia;
  final String? idTipGrado;
  final int idTipoRecaudacion;
  final String? observacion;
  final String? observacionUpg;

  RecaudacionesAlumno(
      {required this.rIdTipoRecaudacion,
      required this.cIdTipoRecaudacion,
      required this.descripcionRecaudacion,
      required this.idRec,
      required this.idAlum,
      required this.apeNom,
      required this.ciclo,
      required this.concepto,
      required this.idconcepto,
      required this.numero,
      required this.dni,
      required this.nombre,
      required this.moneda,
      required this.moneda2,
      required this.importe,
      required this.importeTc,
      required this.fecha,
      required this.anioIngreso,
      required this.idPrograma,
      required this.nomPrograma,
      required this.siglaPrograma,
      required this.codAlumno,
      this.estado,
      this.descripcionUbi,
      required this.descripcionTipo,
      required this.estadoCivil,
      required this.validado,
      required this.repitencia,
      this.idTipGrado,
      required this.idTipoRecaudacion,
      this.observacion,
      this.observacionUpg});

  factory RecaudacionesAlumno.fromJson(Map<String, dynamic> json) {
    return RecaudacionesAlumno(
      rIdTipoRecaudacion: json['r_id_tipo_recaudacion'] as int,
      cIdTipoRecaudacion: json['c_id_tipo_recaudacion'] as int,
      descripcionRecaudacion: json['descripcion_recaudacion'] as String,
      idRec: json['idRec'] as int,
      idAlum: json['idAlum'] as int,
      apeNom: json['apeNom'] as String,
      ciclo: json['ciclo'] as int,
      concepto: json['concepto'] as String,
      idconcepto: json['idconcepto'] as int,
      numero: json['numero'] as String,
      dni: json['dni'] as String,
      nombre: json['nombre'] as String,
      moneda: json['moneda'] as String,
      moneda2: json['moneda2'] as String,
      importe: json['importe'] as double,
      importeTc: json['importe_tc'] as double,
      fecha: json['fecha'] as String,
      anioIngreso: json['anio_ingreso'] as String,
      idPrograma: json['idPrograma'] as int,
      nomPrograma: json['nomPrograma'] as String,
      siglaPrograma: json['sigla_programa'] as String,
      codAlumno: json['codAlumno'] as String,
      estado: json['estado'],
      descripcionUbi: json['descripcion_ubi'],
      descripcionTipo: json['descripcion_tipo'] as String,
      estadoCivil: json['estado_civil'] as String,
      validado: json['validado'] as bool,
      repitencia: json['repitencia'] as String,
      idTipGrado: json['id_tip_grado'],
      idTipoRecaudacion: json['id_tipo_recaudacion'] as int,
      observacion: json['observacion'],
      observacionUpg: json['observacion_upg'],
    );
  }
}
