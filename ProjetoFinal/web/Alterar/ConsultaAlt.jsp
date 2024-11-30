<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Carro"%>
<%@page import="model.dao.CarroDAO"%>
                            

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <h3>Consulta - Alteração (Placa)</h3>
        <%
        int id = Integer.parseInt( request.getParameter("id") );

        Carro car = new Carro();
        car.setId(id);                                                                   

        CarroDAO carDAO = new CarroDAO();
        if(carDAO.conscarId(car) != null){                                                                                                                                                                                                                              
        %>

        <form method="post" action="updateCar.jsp">
            Identificador: <input type="text" name="id" value="<%=car.getId()%>" readonly="true"> <p>
            Nome do motorista: <input type="text" name="nome" value="<%=car.getNome()%>" minlength="3" maxlength="10"> <p>
            Placa: <input type="text" name="placa" value="<%=car.getPlaca()%>" minlength="3" maxlength="15"> <p>
            Modelo: <input type="text" name="modelo" value="<%=car.getModelo()%>"><p>
            Carga: <input type="text" name="carga" value="<%=car.getCarga()%>"><p>
            Capacidade: <input type="text" name="capacidade" value="<%=car.getCapacidade()%>"><p>
            <input type="submit" value="Salvar!">
        </form>
        <%
            out.println("Registro encontrado!");
        }else{
           out.println("Registro não encontrado!");
        }
        %>
    </body>
</html>
