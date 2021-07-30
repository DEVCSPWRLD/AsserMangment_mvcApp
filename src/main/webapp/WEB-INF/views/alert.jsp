<%
		String message1=(String)session.getAttribute("message1");
       if(message1!=null)
       {
    	   out.print(message1);
    	   session.removeAttribute("message1");
    	   
       }
%>
=================================================================================================================================
<%
		String message2=(String)session.getAttribute("message2");
       if(message2!=null)
       {
    	   out.print(message2);
    	   session.removeAttribute("message2");
    	   
       }
%>
=================================================================================================================================

<%
		String message3=(String)session.getAttribute("message3");
       if(message3!=null)
       {
    	   out.print(message3);
    	   session.removeAttribute("message3");
    	   
       }
%>

=================================================================================================================================

<%
		String message4=(String)session.getAttribute("message4");
       if(message4!=null)
       {
    	   out.print(message4);
    	   session.removeAttribute("message4");
    	   
       }
%>