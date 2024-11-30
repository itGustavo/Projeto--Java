<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Carro"%>
<%@page import="model.dao.CarroDAO"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
    </head>
    <body>
        <h1>Carro</h1>
        <%
        int id = Integer.parseInt( request.getParameter("id") );
        String nome = request.getParameter("nome");
        String placa = request.getParameter("placa");
        String modelo = request.getParameter("modelo");
        String carga = request.getParameter("carga");
        String capacidade = request.getParameter("capacidade");

        Carro car = new Carro();
        car.setId(id);
        car.setNome(nome);
        car.setPlaca(placa);
        car.setModelo(modelo);
        car.setCarga(carga);
        car.setCapacidade(capacidade);

        CarroDAO carDAO = new CarroDAO();
        if(carDAO.altCar(car)){
            out.println("Registro Alterado com sucesso!");
        }else{
           out.println("Erro! Registro não Alterado!!!");
        }
        %>
    </body>
</html>
