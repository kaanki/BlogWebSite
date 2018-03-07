<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Login</title>
    <style type="text/css">
        table tr td
        {
            padding:5px;
        }
            table tr td .txtLog 
            {
                width:200px;
                height:20px;
            }
        #button 
        {
            padding:5px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function Kontrol()
        {
            var uyari = "";
            var kadi = $("#txtKadi").val();
            kadi = $.trim(kadi);
            var sifre = $("#txtSifre").val();
            sifre = $.trim(sifre);
            if (kadi == "")
            {
                uyari = "1";
                $("#hata").html("Kullanici Adi Bos gecilemez");
            }
            else if (sifre == "")
            {
                uyari = "1";
                $("#hata").html("Sifre Alani Bos Gecilemez");
            }
            if (uyari == "") { return true; }
            else { return false;}
        }
    </script>
</head>
<body>
    <div>
        <%using(Html.BeginForm("login","Admin",FormMethod.Post,new{@name="formlogin",@id="frmL"})) {%>
        <table>
            <tr>
                <td>Kullanici Adi:</td>
                <td><%:Html.TextBox("txtKullaniciAdi","",new{@id="txtKadi",@class="txtLog"}) %></td>
            </tr>
            <tr>
                <td>Sifre:</td>
                <td><%:Html.Password("txtSifre","",new{@id="txtSifre",@class="txtLog"}) %></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Giris" id="button" onclick="if (!Kontrol()) return false;" /></td>
            </tr>
        </table>
        <div id="hata"></div>
        <%}

            if (ViewBag.Bos == true)
            {
                Response.Write("Lutfen tum alanlari doldruunuz");
            }
            
            if(ViewBag.onay==false)
            {
            Response.Write("Kullanici adi veya sifre yanlis");
            }
          
             %>
    </div>
</body>
</html>
