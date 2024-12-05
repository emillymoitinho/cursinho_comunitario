<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title></title>
        <meta charset="utf-8">
        <style>
            tr:nth-child(even) {
                background-color: lightgray ;
            }

            tr:hover{
                background-color: #363636 ;
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            //variavel para acessar o banco de dados
            String database = "cursinhopimentas"; 
            String endereco = "jdbc:mysql://localhost:3306/" + database ; 
            String usuario  = "root"; 
            String senha    = "";

            //Driver
            String driver = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memoria
            Class.forName( driver ) ;

            //Cria uma variavel para conexao com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection( enderecoBD, usuarioBD , senhaBD ) ;

            //comando para consultar no banco
            String sql = "SELECT * FROM nome-completo" ;

            //cria a variavel do tipo Statement
            PreparedStatement stm = conexao.prepareStatement( sql );

            //cria a variavel do tipo ResultSet
            //para armazenar os dados que estão banco
            ResultSet dados  = stm.executeQuery() ;

            out.print("<table border=1>") ;

            while ( dados.next() )
            {
                out.print("<tr>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("nome-completo") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("data-nascimento") ) ;           
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("sexo") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("rg") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("cpf") ) ;
                    out.print("</td>") ; 
                    
                    out.print("<td>") ;
                        out.print( dados.getString("nome-mae") ) ;
                    out.print("</td>") ;  

                    out.print("<td>") ;
                        out.print( dados.getString("nome-pai") ) ;
                    out.print("</td>") ;  

                    out.print("<td>") ;
                        out.print( dados.getString("telefone") ) ;
                    out.print("</td>") ; 
                    
                    out.print("<td>") ;
                        out.print( dados.getString("celular") ) ;
                    out.print("</td>") ; 
                    
                    out.print("<td>") ;
                        out.print( dados.getString("email") ) ;
                    out.print("</td>") ; 

                    out.print("<td>") ;
                        out.print( dados.getString("endereco") ) ;
                    out.print("</td>") ; 

                    out.print("<td>") ;
                        out.print( dados.getString("bairro") ) ;
                    out.print("</td>") ;
                    
                    out.print("<td>") ;
                        out.print( dados.getString("cep") ) ;
                    out.print("</td>") ; 

                    out.print("<td>") ;
                        out.print( dados.getString("numero") ) ;
                    out.print("</td>") ; 

                    out.print("<td>") ;
                        out.print( dados.getString("complemento") ) ;
                    out.print("</td>") ; 

                out.print("</tr>") ;
            }

            out.print("</table>") ;
        %>
    </body>
</html>