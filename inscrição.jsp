<%@page language="java" import="java.sql.*" %>

<%
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

    // Converte os campos numéricos (cep e numero) para inteiros
    int vcepInt = Integer.parseInt(vcep);   // Converte vcep para int
    int vnumeroInt = Integer.parseInt(vnumero); // Converte vnumero para int

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

   //Varival para o comando Insert do SQL
    String sql = "INSERT INTO candidatos (nome_completo, data_nascimento, sexo, rg, cpf, nome_mae, nome_pai, telefone, celular, email, endereco, bairro, cep, numero, complemento) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


   //Cria a variavel Statement para executar o SQL
   PreparedStatement stm = conexao.prepareStatement(sql);

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

   stm.execute() ;
   stm.close() ;

   out.print("<h3>Dados gravados!</h3>") ;
   out.print("<br><br>") ;
   out.print("<a href='formulario_cadastro.html'>Voltar</a>") ;

%>


