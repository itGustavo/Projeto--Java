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
        <h3> Consulta Geral (Lista / Linhas)</h3>
        
        <%
        CarroDAO carDAO = new CarroDAO();

        List<Carro> lista = new ArrayList<>();                 
        lista = carDAO.consCarLista();

        int nreg = 0 ;
        out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        out.println("<br> <b>Consulta de placas - Registros</b>");

        out.println("<br><br> # | Id. | Nome | Placa | Modelo | Carga | Capacidade <br>" );
        out.println("__ <br>" );
        for( int i = 0; i <= lista.size()-1; i++){
            out.println(i +" - "+ lista.get(i).getId() +" - "+ lista.get(i).getNome_car() +" - "+ lista.get(i).getPlaca()+" - "+ lista.get(i).getModelo(  ) +" - "+ lista.get(i).getCarga() +" - " + lista.get(i).getCapacidade()+" - " + "<br>");
            n_reg++;                         
        }                                        
       out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");                                                                                                                                                                
       out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");
        %>

    </body>
</html>