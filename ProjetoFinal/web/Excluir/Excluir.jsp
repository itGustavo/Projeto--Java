<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Carro"%>
<%@page import="model.dao.CarroDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Excluir(Placa)</h3>
        <%
        int id = Integer.parseInt( request.getParameter("id") );

        Carro car = new Carro();
        Car.setId(id);                                                                                                
       
        CarroDAO carDAO = new CarroDAO();
        if(carDAO.exCarroId(car) ){                                                                                                                                                                 
            out.println("Registro excluido!");        
        }else{
           out.println("Registro não excluído!!!");
        }
        %>
    </body>
</html>

