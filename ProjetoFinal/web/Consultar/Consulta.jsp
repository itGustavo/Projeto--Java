<%@page contentType="text/html" pageEncoding="UTF-8"%>                                          
<%@page import="modelo.Carro"%>
<%@page import="model.dao.CarroDAO"%>     

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                     
        <title>Consultar</title>                                      
    </head>
    <body>
        <h3>Pesquisa - Consulta (Identificação)</h3>
        <%
        int id = Integer.parseInt( request.getParameter("id") );

        Carro car = new Carro();
        Car.setId(id);                                            
             
        CarroDAO carDAO = new CarroDAO();
        if(carDAO.consCarId(car) != null){                                                                                               
            out.println("<b>Identificação: </b>" + car.getId() + "<br>");
            out.println("<b>Nome: </b>" + car.getNome()+ "<br>");
            out.println("<b>Placa: </b>" + car.getPlaca()+ "<br>");
            out.println("<b>Modelo: </b>" + car.getModelo()+ "<br>");
            out.println("<b>Carga: </b>" + car.getCarga()+ "<br>");
            out.println("<b>Capacidade: </b>" + car.getCapacidade()+ "<br>");
        }else{
           out.println("Registro não encontrado!!!");
        }
        %>
    </body>
</html>

     