<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriekle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <article class="module width_full">
        <header><h3>Kategori Ekle</h3></header>
        <%using(Html.BeginForm("kategoriekle","admin",FormMethod.Post,new{@name="frmKAT"})){ %>

        <table>
            <tr>
                <td>Kategori Adi</td>
                <td><%:Html.TextBox("txtKategoriAdi") %></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Ekle"/></td>
            </tr>
        </table>
        <%}

            if (!IsPostBack)
            {
                if (ViewBag.bos == true)
                {
                    Response.Write("Kategori adini giriniz");
                }
                else
                {
                    if (ViewBag.var == true)
                    {
                        Response.Write("Boyle bir kategori adi mevcut");
                    }
                    if (ViewBag.eklendi == true)
                    {
                        Response.Write("Kategori eklendi");
                    }
                }
            }
          
           %>
    </article>

<h2>kategoriekle</h2>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
