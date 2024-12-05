<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastros</title>
    <link rel="stylesheet" href="style/consulta.css">
</head>
<body>
    <header>
        <img src="images/fundo_form.jpg" alt="">
    </header>
    <h1>Inscritos</h1>
    <%
            //variavel para acessar o banco de dados
            String database = "cursinhopimentas"; 
            String enderecoBD = "jdbc:mysql://localhost:3306/" + database ; 
            String usuarioBD  = "root"; 
            String senhaBD    = "";

            //Driver
            String driver = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memoria
            Class.forName( driver ) ;

            //Cria uma variavel para conexao com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection( enderecoBD, usuarioBD , senhaBD ) ;

            //comando para consultar no banco
            String sql = "SELECT * FROM candidatos" ;

            //cria a variavel do tipo Statement
            PreparedStatement stm = conexao.prepareStatement( sql );

            //cria a variavel do tipo ResultSet
            //para armazenar os dados que estão banco
            ResultSet dados  = stm.executeQuery() ;

            out.print("<table border=1>") ;
            out.print("<tr class='header'>") ;
                    out.print("<th>") ;
                        out.print("ID") ;
                    out.print("</th>") ;

                    out.print("<th>") ;
                        out.print("Nome") ;
                    out.print("</th>") ;

                    out.print("<th>") ;
                        out.print("Data de Nascimento") ;
                    out.print("</th>") ;
   
                out.print("</tr>");

            while ( dados.next() )
            {
                
                out.print("<tr>");
                    out.print("<td class='id'>") ;
                        out.print( dados.getString("id") ) ;
                    out.print("</td>") ;

                    out.print("<td class='nome'>") ;
                        out.print( dados.getString("nome_completo") ) ;
                    out.print("</td>") ;

                    out.print("<td class='nasc'>") ;
                        out.print( dados.getString("data_nascimento") ) ;           
                    out.print("</td>") ;

                    // out.print("<td>") ;
                    //     out.print( dados.getString("sexo") ) ;
                    // out.print("</td>") ;

                    // out.print("<td>") ;
                    //     out.print( dados.getString("rg") ) ;
                    // out.print("</td>") ;

                    // out.print("<td>") ;
                    //     out.print( dados.getString("cpf") ) ;
                    // out.print("</td>") ; 
                    
                    // out.print("<td>") ;
                    //     out.print( dados.getString("nome_mae") ) ;
                    // out.print("</td>") ;  

                    // out.print("<td>") ;
                    //     out.print( dados.getString("nome_pai") ) ;
                    // out.print("</td>") ;  

                    // out.print("<td>") ;
                    //     out.print( dados.getString("telefone") ) ;
                    // out.print("</td>") ; 
                    
                    // out.print("<td>") ;
                    //     out.print( dados.getString("celular") ) ;
                    // out.print("</td>") ; 
                    
                    // out.print("<td>") ;
                    //     out.print( dados.getString("email") ) ;
                    // out.print("</td>") ; 

                    // out.print("<td>") ;
                    //     out.print( dados.getString("endereco") ) ;
                    // out.print("</td>") ; 

                    // out.print("<td>") ;
                    //     out.print( dados.getString("bairro") ) ;
                    // out.print("</td>") ;
                    
                    // out.print("<td>") ;
                    //     out.print( dados.getString("cep") ) ;
                    // out.print("</td>") ; 

                    // out.print("<td>") ;
                    //     out.print( dados.getString("numero") ) ;
                    // out.print("</td>") ; 

                    // out.print("<td>") ;
                    //     out.print( dados.getString("complemento") ) ;
                    // out.print("</td>") ; 

                out.print("</tr>") ;
            }

            out.print("</table>") ;
        %>
        <div class="btn">
        <button><a href="formulario_cadastro.html">Voltar</a></button>
        </div>
        <script src="script.js"></script>
</body>
</html>