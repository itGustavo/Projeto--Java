<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Carro"%>
<%@page import="model.dao.CarroDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <h1>Cadastro</h1>
        <%
        String nome = request.getParameter("nome");
        String placa = request.getParameter("placa");
        String modelo = request.getParameter("modelo");
        String carga = request.getParameter("carga");
        String capacidade = request.getParameter("capacidade");
        
        Carro car = new Carro();
        car.setNome(nome);
        car.setPlaca(placa);
        car.setModelo(modelo);
        car.setCarga(carga);
        car.setCapacidade(capacidade);
        
        CarroDAO CarroDAO = new CarroDAO();
        if(CarroDAO.insCarro(car)){                                                     
            out.println("Caminhão cadastrado com sucesso!");
        }else{
           out.println("Erro! Caminhão não Cadastrado");
        }


        %>
    </body>
</html>

