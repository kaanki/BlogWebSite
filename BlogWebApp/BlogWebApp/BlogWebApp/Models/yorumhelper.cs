using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogWebApp.Models
{
    public class yorumhelper
    {
        public int ID { get; set; }
        public string makaleAdi { get; set; }
        public string email { get; set; }
        public string yorum { get; set; }
        public int onay { get; set; }
        public string isim { get; set; }

    }
}