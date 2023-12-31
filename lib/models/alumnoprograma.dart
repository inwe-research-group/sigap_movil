class AlumnoPrograma {
  final String codAlumno;
  final String apePaterno;
  final String apeMaterno;
  final String nomAlumno;
  final String codEspecialidad;
  final String codTipIngreso;
  final String codSitu; //situacion  regular
  final String codPerm; //permanencia graduado egresado

  final String anioIngreso;
  final String dniM;
  final int idPrograma;
  final String nomPrograma;
  final String siglaProg;
  final String? idTipGrado;

  AlumnoPrograma(
      {required this.codAlumno,
      required this.apePaterno,
      required this.apeMaterno,
      required this.nomAlumno,
      required this.codEspecialidad,
      required this.codTipIngreso,
      required this.codSitu,
      required this.codPerm,
      required this.anioIngreso,
      required this.dniM,
      required this.idPrograma,
      required this.nomPrograma,
      required this.siglaProg,
      this.idTipGrado});

  factory AlumnoPrograma.fromJson(Map<String, dynamic> json) {
    return AlumnoPrograma(
      codAlumno: json['codAlumno'] as String,
      apePaterno: json['apePaterno'] as String,
      apeMaterno: json['apeMaterno'] as String,
      nomAlumno: json['nomAlumno'] as String,
      codEspecialidad: json['codEspecialidad'] as String,
      codTipIngreso: json['codTipIngreso'] as String,
      codSitu: json['codSitu'] as String,
      codPerm: json['codPerm'] as String,
      anioIngreso: json['anioIngreso'] as String,
      dniM: json['dniM'] as String,
      idPrograma: json['idPrograma'] as int,
      nomPrograma: json['nom_programa'] as String,
      siglaProg: json['siglaProg'] as String,
      idTipGrado: json['idTipGrado'],
    );
  }
}
