package model.dao;
import modelo.Carro;
import util.ConectaDB;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class CarroDAO {

    public boolean insCarro(Carro p_carro) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "INSERT INTO carro (id, nome, placa, modelo, carga, capacidade) VALUES ('" 
                        + p_carro.getId() + "', '" 
                        + p_carro.getNome() + "', '" 
                        + p_carro.getPlaca() + "', '" 
                        + p_carro.getModelo() + "', '" 
                        + p_carro.getCarga() + "', " 
                        + p_carro.getCapacidade() + ")";
            
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }

    public Carro consCarroId(Carro p_car) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM carro WHERE pkid = " + p_car.getId();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                p_car.setId(rs.getString("pkid"));
                p_car.setNome(rs.getString("nome"));
                p_car.setPlaca(rs.getString("placa"));
                p_car.setModelo(rs.getString("modelo"));
                p_car.setCarga(rs.getString("carga"));
                p_car.setCapacidade(rs.getString("capacidade"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return p_car;
            }
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex);
            return null;
        }
    }

    public List<Carro> consCarLista() throws ClassNotFoundException {
        List<Carro> lista = new ArrayList<>();
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM carro";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Carro carro = new Carro();
                carro.setId(rs.getString("pkid"));
                carro.setNome(rs.getString("nome"));
                carro.setPlaca(rs.getString("placa"));
                carro.setModelo(rs.getString("modelo"));
                carro.setCarga(rs.getString("carga"));
                carro.setCapacidade(rs.getString("capacidade"));
                lista.add(carro);
            }
            conexao.close();
            return lista;
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex);
            return null;
        }
    }

    public boolean exCarId(Carro p_car) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM carro WHERE pkid = " + p_car.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }

    public boolean altCar(Carro p_car) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "UPDATE carro SET nome = '" + p_car.getNome() + "', " +
                         "placa = '" + p_car.getPlaca() + "', " +
                         "modelo = '" + p_car.getModelo() + "', " +
                         "carga = '" + p_car.getCarga() + "', " +
                         "capacidade = " + p_car.getCapacidade() + " " +
                         "WHERE pkid = " + p_car.getId();

            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }
}
