<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogWebApp.Models.makaleHelper>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Makaleler
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <article class="module width_full">
        <header><h3>Makaleler</h3></header>
        <%if (ViewBag.sayi > 0)
          { %>
        <table>
            <tr>
                <th>Makale ID</th>
                <th>Makale Adi</th>
                <th>Kategori Adi</th>
                <th>Makale Kisa Aciklamasi</th>
                <th>Makale</th>
                <th>Keyword</th>
                <th>Description</th>
                <th>Yazar Adi</th>
                <th>Title</th>
                <th colspan="2">Duzenle</th>
            </tr>
            <%
              foreach (var item in Model)
              { %>
            <tr>
                <td><%=Html.DisplayName(item.makaleID.ToString())%></td>
                <td><%=Html.DisplayName(item.makaleAdi)%></td>
                <td><%=Html.DisplayName(item.kategoriAdi)%></td>
                <td><%Response.Write(item.makaleKisaAciklama); %></td>
                <td><%Response.Write(item.makale); %></td>
                <td><%=Html.DisplayName(item.makaleKeyword)%></td>
                <td><%=Html.DisplayName(item.makaleDescription)%></td>
                <td><%=Html.DisplayName(item.yazarAdi)%></td>
                <td><%=Html.DisplayName(item.makaleTitle)%></td>
                <td><%=Html.ActionLink("Duzenle", "makaleduzenle", new { id = item.makaleID })%></td>
                <td><%=Html.ActionLink("Sil", "makalesil", new { id = item.makaleID })%></td>
            </tr>
            <%}
               %>
        </table>
        <%}
          else Response.Write("makale Bulunamadi");%>

        <ul>
            <%
                int sayfasayisi = Convert.ToInt32(ViewBag.sayfasayisi);
                int sayfa = Convert.ToInt32(ViewBag.sayfa);

                if (sayfasayisi > 1)
                {
                    for (int i = 1; i <=sayfasayisi; i++)
                    {
                        if (i == sayfa)
                        {
                            Response.Write("<li class='aktif'>" + i.ToString());
                        }
                        else
                        {
                            Response.Write("<li>");
                            %><%:Html.ActionLink(i.ToString(),"makaleler",new{id=i})%>
                        <%}
                    }
                }
                
                 %>
        </ul>
    </article>




</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        ul 
        {
            display:inline;
        }
            ul li 
            {
                list-style-type:none;
                float:left;
            }
                ul li a 
                {
                    color:#fff;
                }
                    ul li a href 
                    {
                        text-decoration:underline;
                    }
        .aktif 
        {
            font-weight:800;
        }
    </style>
</asp:Content>
