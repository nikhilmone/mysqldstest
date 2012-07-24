<%@page import="javax.sql.*,java.sql.*,java.util.*,javax.naming.*" %>
<%
       String jndiName = "java:jboss/datasources/MysqlDS";
       Connection con = null;

       try{            
            Context ic = new InitialContext();
            System.out.println("\n\tAbout to look up jndi name " + jndiName);
            Object obj = ic.lookup(jndiName);
            System.out.println("lookup returned " + obj);
            
            javax.sql.DataSource ds = (javax.sql.DataSource) obj;
            System.out.println("\n\tGot the DataSource: " + ds);
            

            con=ds.getConnection();

            System.out.println("\n\t[ds.getConnection()].getClass().getName(): " + con.getClass().getName());
            System.out.println("\n\n\t GOT Connection at: "+new java.util.Date());
           
	   }

     finally{

	       if(con!=null)
		      {
			      System.out.println("\n\tfinally{}  if(con!=null) ");
			      try{    con.close();   } catch(Exception e){ e.printStackTrace(); }
		      }
	 }
		   out.println("<h1>Successfully Got the Connection ...");;
%>
