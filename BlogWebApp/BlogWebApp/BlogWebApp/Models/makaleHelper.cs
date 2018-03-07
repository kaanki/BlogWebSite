using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogWebApp.Models
{
    public class makaleHelper
    {
        public int makaleID { get; set; }
        public string makaleAdi { get; set; }
        public string makaleKisaAciklama { get; set; }
        public string makale { get; set; }
        public string makaleKeyword { get; set; }
        public string makaleDescription { get; set; }
        public string makaleTitle { get; set; }
        public string kategoriAdi { get; set; }
        public string yazarAdi { get; set; }
        public string resim { get; set; }
        public string makaleAciklama { get; set; }
    }
}