
import 'package:empleo_app/domain/domain.dart';

class Usuario {
    int? id;
    String nombre;
    String email;
    String password;
    String cedula;
    String? imagen;
    DateTime? feNacimiento;
    DateTime? feRegistro;
    String? sexo;
    String? estado;
    TpUsuario? tpUsuario;
    Provincia? provincia;

    Usuario({
        this.id,
        required this.nombre,
        required this.email,
        required this.password,
        required this.cedula,
        this.imagen,
        this.feNacimiento,
        this.feRegistro,
        this.sexo,
        this.estado,
        this.tpUsuario,
        this.provincia,
    });

    Usuario copyWith({
        int? id,
        String? nombre,
        String? email,
        String? password,
        String? cedula,
        String? imagen,
        DateTime? feNacimiento,
        DateTime? feRegistro,
        String? sexo,
        String? estado,
        TpUsuario? tpUsuario,
        Provincia? provincia,
    }) => 
    Usuario(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        email: email ?? this.email,
        password: password ?? this.password,
        cedula: cedula ?? this.cedula,
        imagen: imagen ?? this.imagen,
        feNacimiento: feNacimiento ?? this.feNacimiento,
        feRegistro: feRegistro ?? this.feRegistro,
        sexo: sexo ?? this.sexo,
        estado: estado ?? this.estado,
        tpUsuario: tpUsuario ?? this.tpUsuario,
        provincia: provincia ?? this.provincia,
    );

}

