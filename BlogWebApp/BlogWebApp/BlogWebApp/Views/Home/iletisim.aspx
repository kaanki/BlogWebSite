<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    iletisim
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        
        	
            
            <div class="content_wrapper content_mb_60">
            <div id="contact_form">
                <h3>Iletisim Formu</h3>
                <%using (Html.BeginForm()) { %>
                    
               <%--buraya sayfa tasarimi gelecek--%>



                    
                <%    
                }  %>
            </div> 
            <div class="clear"></div>
		</div>        
        <div class="content_wrapper content_mb_30">
        	<div class="col_2">
               
			</div>
            <div class="col_2 no_margin_right">
             
               
			</div>
		</div>
        <h3>Harita</h3> 
        <div class="img_border">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3125.6708370761557!2d27.136763951668896!3d38.42597118209749!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14b8e31d22fb88d1%3A0x31458d18078ea54d!2sBilge+Adam+%C4%B0zmir!5e0!3m2!1str!2str!4v1508864680135" width="630" height="150" frameborder="0" style="border:0" ></iframe></div><br />

            	
       


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
