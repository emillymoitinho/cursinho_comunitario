<%@page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    
    //cria as variaveis e armazena as informações digitadas pelo usuário
    String vnome  = request.getParameter("nome-completo") ;
    String vdataNascimento  = request.getParameter("data-nascimento") ;
    String vsexo  = request.getParameter("sexo") ;
    String vrg  = request.getParameter("rg") ;
    String vcpf  = request.getParameter("cpf") ;
    String vmae  = request.getParameter("nome-mae") ;
    String vpai  = request.getParameter("nome-pai") ;
    String vtelefone  = request.getParameter("telefone") ;
    String vcelular  = request.getParameter("celular") ;
    String vemail = request.getParameter("email");
    String vendereco = request.getParameter("endereco");
    String vbairro = request.getParameter("bairro");
    String vcep = request.getParameter("cep");
    String vnumero = request.getParameter("numero");
    String vcomplemento = request.getParameter("complemento");

    int vcepInt = Integer.parseInt(vcep); 
    int vnumeroInt = Integer.parseInt(vnumero); 

    //variaveis para acessar o banco de dados
    String database = "cursinhopimentas"; 
    String endereco = "jdbc:mysql://localhost:3306/" + database ; 
    String usuario  = "root"; 
    String senha    = "";

    //Driver 
    String driver = "com.mysql.jdbc.Driver" ;

    //Carrega o driver na memoria
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

    //Abrir a conexao com o banco
    conexao = DriverManager.getConnection( endereco , usuario, senha) ;

    // Verifica duplicidade de CPF ou RG
    String verificaSql = "SELECT COUNT(*) AS count FROM candidatos WHERE cpf = ? OR rg = ?";
    PreparedStatement verificaStm = conexao.prepareStatement(verificaSql);
    verificaStm.setString(1, vcpf);
    verificaStm.setString(2, vrg);

    ResultSet rs = verificaStm.executeQuery();
    rs.next();
    int count = rs.getInt("count");
    rs.close();
    verificaStm.close();

    if (count > 0) {
        // Exibe mensagem de erro caso já exista
        response.sendRedirect("erro.html");
    } else {
        // Declaração da variável sql movida para evitar conflito
        String sqlInsert = "INSERT INTO candidatos (nome_completo, data_nascimento, sexo, rg, cpf, nome_mae, nome_pai, telefone, celular, email, endereco, bairro, cep, numero, complemento) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        //Cria a variavel Statement para executar o SQL
        PreparedStatement stm = conexao.prepareStatement(sqlInsert);

        stm.setString(1, vnome);
        stm.setString(2, vdataNascimento);
        stm.setString(3, vsexo);
        stm.setString(4, vrg);
        stm.setString(5, vcpf);
        stm.setString(6, vmae);
        stm.setString(7, vpai);
        stm.setString(8, vtelefone);
        stm.setString(9, vcelular);
        stm.setString(10, vemail);
        stm.setString(11, vendereco);
        stm.setString(12, vbairro);
        stm.setInt(13, vcepInt);
        stm.setInt(14, vnumeroInt);
        stm.setString(15, vcomplemento);

        stm.execute();
        stm.close();

        // Redireciona para a página de sucesso
        response.sendRedirect("consulta.jsp");
    }

    conexao.close();
%>
