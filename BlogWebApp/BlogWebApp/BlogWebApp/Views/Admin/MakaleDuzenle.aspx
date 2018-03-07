<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.makaleler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MakaleDuzenle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>MakaleDuzenle</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>makaleler</legend>

        <%: Html.HiddenFor(model => model.ID) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makaleAdi) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.makaleAdi) %>
            <%: Html.ValidationMessageFor(model => model.makaleAdi) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makaleKisaAciklama) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.makaleKisaAciklama, new { @class="ckeditor",@id="ckeditor"}) %>
            <%: Html.ValidationMessageFor(model => model.makaleKisaAciklama) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makaleDescription) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.makaleDescription) %>
            <%: Html.ValidationMessageFor(model => model.makaleDescription) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makaleKeyword) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.makaleKeyword) %>
            <%: Html.ValidationMessageFor(model => model.makaleKeyword) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makaleTitle) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.makaleTitle) %>
            <%: Html.ValidationMessageFor(model => model.makaleTitle) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.yazarID) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("yazarlar") %>
            <%: Html.ValidationMessageFor(model => model.yazarID) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.kategoriID) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("kategoriler") %>
            <%: Html.ValidationMessageFor(model => model.kategoriID) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.makale) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.makale, new { @class="ckeditor",@id="ckeditor"})%>
            <%: Html.ValidationMessageFor(model => model.makale) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% }

    if (!Page.IsPostBack)
    {
        Response.Write(ViewBag.duzenle);
    }
   
   
    %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
