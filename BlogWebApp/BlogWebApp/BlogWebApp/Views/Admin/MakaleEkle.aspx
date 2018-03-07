<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.kategoriler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MakaleEkle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>MakaleEkle</h2>

    <article class="module width_full">

        <table>
            <%using (Html.BeginForm("makaleekle", "admin", FormMethod.Post, new { @enctype = "multipart/form-data" }))
              { %>
            <tr>
                <td>Makale Adi</td>
                <td><%:Html.TextBox("makaleAdi")%></td>
            </tr>
            <tr>
                <td>Resim</td>
                <td><%:Html.TextBox("file","",new{@type="file"}) %></td>
                
            </tr>
            <tr>
                <td>Kategori Adi</td>
                <td><%:Html.DropDownList("kategoriler")%></td>
            </tr>
            <tr>
                <td>Makale Kisa Aciklama</td>
                <td><%:Html.TextArea("makaleKisaAciklama", new { @id = "ckeditor", @class = "ckeditor" })%></td>
            </tr>
            <tr>
                <td>Makale</td>
                <td><%:Html.TextArea("makale", new { @id = "ckeditor", @class = "ckeditor" })%></td>
            </tr>
            <tr>
                <td>Makale Title</td>
                <td><%:Html.TextBox("makaleTitle")%></td>
            </tr>
            <tr>
                <td>Makale Description</td>
                <td><%:Html.TextBox("makaleDescription")%></td>
            </tr>
            <tr>
                <td>Makale Keyword</td>
                <td><%:Html.TextBox("makaleKeyword")%></td>
            </tr>
            <tr>
                <td>Yazar</td>
                <td><%:Html.DropDownList("yazarlar")%></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Ekle" /></td>
            </tr>
        </table>
        <%}

              if (!Page.IsPostBack)
                  Response.Write(ViewBag.basarili);
          
        %>
    </article>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
