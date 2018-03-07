<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogWebApp.Models.yorumhelper>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    yorumlar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <article class="module width_full">
        <header><h3>KategoriList</h3></header>
        <p style="font-size:20px; padding:10px">
            <%
                if (!String.IsNullOrEmpty(ViewBag.mesaj))
                {
                    Response.Write(ViewBag.mesaj);
                }
                
                 %>
        </p>
        <header>
            <h2>yorumlar</h2>
        </header>
        <table>
            <tr>
                <td>ID</td>
                <td>Makale Adi</td>
                <td>Isim</td>
                <td>Email</td>
                <td>Yorum</td>
                <td>Onay</td>
            </tr>
            <%
                foreach (var item in Model)
                {
                    Response.Write("<tr><td>" + item.ID + "</td><td>" + item.makaleAdi + "</td><td>" + item.isim + "</td><td>" + item.email + "</td><td>" + item.yorum + "</td><td>");
                    if (item.onay == 1)
                    {
                        Response.Write("<a href='" + Url.Action("onaydurumu", new { id = item.ID, sayfa = "onaykaldir" }) + "'>Onayi Kaldir</a>");
                    }
                    else
                    { 
                    Response.Write("<a href='"+Url.Action("onaydurumu",new{id=item.ID,sayfa="onayla"})+"'>Onayla</a>");
                    }
                    Response.Write("<td></tr>");
                }
                
            %>
        </table>
    </article>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
