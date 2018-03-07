using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace BlogWebApp.Models
{
    public class mail
    {
        public bool mailGonder(string gelenMail,string konu,string mesaj)
        { 
         //içeriği girilmiş olan metinden faydalanarak bu class içerisinde ozhangulal@gmail.com üzerinden yine ozhangulal@gmail.com a mail atıyoruz...

            try
            {
                MailMessage email = new MailMessage();
                string mail = gelenMail;
                string Host = "smtp.gmail.com"; //gmaillerin bulundugu host
                string smtpUserName = "ozhangulal@gmail.com";
                string smtpPassword = "*******"; //sifre gelecek
                email.From = new MailAddress("ozhangulal@gmail.com"); //hangi mail adresi uzerinden gonderecegim bilgiyi 
                int smtpPort = 465; //
                email.IsBodyHtml = true; //mail govdesi içerisinde html e musade edilmesi durumu
                email.Subject = konu;
                string body = mesaj;
                email.Body = body;
                email.To.Add(new MailAddress("ozhangulal@gmail.com")); //kime mail gidecek webApp sorumlusunun mail adresi
                email.BodyEncoding = System.Text.Encoding.UTF8; //mail govdesi içeriğinin turkce karakter destegi
                SmtpClient smtp = new SmtpClient(Host, smtpPort);
                smtp.EnableSsl = true;  //SSL guvenlik sertifikasi sizin gondereceginiz mail adresi ve mailin içerisgi ne kadar guvenilir bunu karsi tarafin mailine ileten yapi
                smtp.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword); //mail adresinize ait olan genel bilgilerin karsi tarafta ki sunucuya gonderilmesi bu sayede zararli bir mail adresi olup olmadigi ortaya cikmakta
                smtp.Send(email);
                return true;

            }
            catch (Exception)
            {
                
                return false;
            }

        }
    }
}