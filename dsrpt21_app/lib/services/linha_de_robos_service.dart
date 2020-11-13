import 'package:dio/dio.dart';
import 'package:dsrpt21_app/models/linha_de_robos_model.dart';
import 'package:dsrpt21_app/services/Service_config.dart';

class LinhaDeRobosService {
  static final String _endpoint =
      "https://5fac44b503a60500167e7be2.mockapi.io/DSRPT21_APP";

  static final String _resource = 'teste';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<LinhaDeRobosModel>> findAll() async {
    List<LinhaDeRobosModel> lista = new List<LinhaDeRobosModel>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              LinhaDeRobosModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return lista;
  }

  Future<void> create(LinhaDeRobosModel linhaDeRobosModel) async {
    try {
      linhaDeRobosModel.id = 0;
      Response response = await service.create().post(
            _resource,
            data: linhaDeRobosModel.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<LinhaDeRobosModel> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = LinhaDeRobosModel.fromMap(response.data);
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(LinhaDeRobosModel linhaDeRobosModel) async {
    try {
      String endpoint = _resource + "/" + linhaDeRobosModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: linhaDeRobosModel.toMap(),
          );

      var retorno = (response.data["id"] is String)
          ? int.parse(response.data["id"])
          : response.data["id"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }
}
