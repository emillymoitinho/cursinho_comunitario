<%@page language="java" import="java.sql.*" %>

<%
    //cria as variaveis e armazena as informações digitadas pelo usuário
    String vnomecompleto  = request.getParameter("nome-completo") ;
    int    vdatanascimento = Integer.parseInt( request.getParameter("data-nascimento") );
    String vsexo = request.getParameter("genero");
    int    vrg = Integer.parseInt( request.getParameter("rg") );
    int    vcpf = Integer.parseInt( request.getParameter("cpf") );
    String vnomemae = request.getParameter("nome-mae");
    String vnomepai = request.getParameter("nome-pai");
    int    vtelefone = Integer.parseInt( request.getParameter("telefone") );
    int    vcelular = Integer.parseInt( request.getParameter("celular") );
    String vemail  = request.getParameter("txtemail") ;
    String vcomprovanteEndereco = request.getParameter("txtcomprovante-endereco");
    String vdeclaracaoMatricula = request.getParameter("txtdeclaracao-matricula");

    // Converte a data de nascimento para o formato adequado
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.sql.Date sqlDataNascimento = new java.sql.Date(sdf.parse(vdataNascimento).getTime());


    //variaveis para acessar o banco de dados
    String database = "web"; 
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
   String sql = "INSERT INTO candidatos (nome-completo, data-nascimento, genero, rg, cpf, nome-mae, nome-pai, telefone, celular, email, comprovante-endereco, declaracao-matricula) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ;

   //Cria a variavel Statement para executar o SQL
   PreparedStatement stm = conexao.prepareStatement(sql) ;
   stm.setString( 1 , vnomecompleto ) ;
   stm.setDate( 2 , vdatanascimento ) ;
   stm.setString( 2 , vsexo) ;
   stm.setInt( 3 , vrg ) ;
   stm.setString( 4 , vcpf ) ;
   stm.setString( 5 , vnomemae ) ;
   stm.setString( 6 , vnomepai ) ;
   stm.setInt( 7 , vtelefone ) ;
   stm.setInt( 8 , vcelular ) ;
   stm.setString( 9 , vendereco ) ;
   stm.setString( 10 , vemail ) ;
   stm.setString(11, vcomprovanteEndereco);
   stm.setString(12, vdeclaracaoMatricula);


   stm.execute() ;
   stm.close() ;

   out.print("<h3>Dados enviados com Sucesso!!!</h3>") ;
   out.print("<br><br>") ;
   out.print("<h3>Em breve entraremos em contato para maiores informações e envio de documentações!!!</h3>") ;
   out.print("<a href='cadastro.html'>Voltar</a>") ;

%>


