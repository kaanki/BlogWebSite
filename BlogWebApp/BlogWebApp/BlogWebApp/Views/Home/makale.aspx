<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.Models.makaleHelper>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%Response.Write(Model.makaleTitle); %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="post">
	            <h2><a href="fullpost.html"><%Response.Write(Model.makaleAdi); %></a></h2>
                <div class="post_meta">
                    <span class="post_author"><a href="#"><%Response.Write(Model.yazarAdi); %></a></span>
                    <span class="tag"><a href="#">Free</a>, <a href="#"><%Response.Write(Model.kategoriAdi); %></a></span>
                    <span class="comment">10</span>
				</div> 
                <img class="img_border img_border_b" style="width:600px; height:200px" src="<%:Url.Content(Model.resim) %>" alt="Post Image" />
                <p><%Response.Write(Model.makaleAciklama); %></p>            
			</div>
        	
           <h4>Comments</h4>
            
           <ol class="comment_list">
            <li>
                <div class="comment_box">
                    
                    <div class="comment_content">
	                   
                        

                        <%var yorumListe = (IEnumerable<BlogWebApp.yorumlar>)ViewBag.yorumList;


                          foreach (var item in yorumListe)
                          {
                              Response.Write("<div class='comment_meta'><strong><a href='#'>" + item.isim + "</a></strong></div><p>" + item.mesaj + "</p>");
                          } 
                          %>
                        <a href="#" class="more">Reply</a>
                    </div>
                    <div class="clear"></div>
                </div>
            </li>

        </ol>
        
        <div class="clear"></div>

            <div id="comment_form">
                <h3>Yorum Yap</h3>
                
                <%using(Html.BeginForm()){ %>
                <label>Isim(*)</label>
                <%:Html.TextBox("isim", "", new { @class="input_field",@required="true"})%>
                <label>Email(*)</label>
                <%:Html.TextBox("email", "", new { @class="input_field",@required="true"})%>
                <label>Yorum(*)</label>
                <%:Html.TextArea("yorum", "", new { @required="true"})%>
                

                <input type="submit" name="Yorum yap" value="Submit" class="submit_btn"/>

                <%}

                    if (!String.IsNullOrEmpty(ViewBag.basarili))
                    {
                        Response.Write(ViewBag.basarili);
                    }
                  
                   %>
            </div>
            
            	
      

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <meta content="<%Response.Write(Model.makaleKeyword); %>" name="keyword"/>
    <meta content="<%Response.Write(Model.makaleDescription); %>" name="description"/>
</asp:Content>
