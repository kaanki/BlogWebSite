using BlogWebApp.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogWebApp.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        BlogDbDataContext vt = new BlogDbDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult login()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult login(FormCollection frm)
        {
            string kullaniciAdi = frm.Get("txtKullaniciAdi").Trim();
            string sifre = frm.Get("txtSifre").Trim();
            if (kullaniciAdi == "" || sifre == "")
            {
                ViewBag.Bos = true;
            }
            else
            {
                BlogDbDataContext vt = new BlogDbDataContext();
                var kayit = from k in vt.yoneticilers where k.kullaniciAdi == kullaniciAdi && k.Sifre == sifre select new { k.ID };
                if (kayit.ToList().Count > 0)
                {
                    Session.Add("giris", true);
                    foreach (var item in kayit)
                    {
                        Session.Add("id", item.ID);
                    }
                    return RedirectToAction("index");
                }
                else
                {
                    ViewBag.onay = false;
                }
            }
            return View();
        }

        private String UrlTemizle(string data)
        {
            data = data.Replace(",", "").Replace("\"", "").Replace(":", "").Replace(";", "").Replace(".", "").Replace("!", "").Replace("?", "").Replace(")", "").Replace("(", "").Replace("&", "").Replace(" ", "").Replace("ç", "c").Replace("ğ", "g").Replace("ı", "i").Replace("ö", "o").Replace("ş", "s").Replace("ü", "u");

            return data;
        }

        public ActionResult kategoriekle()
        {

            BlogDbDataContext vt = new BlogDbDataContext();
            if (Request.HttpMethod == "POST")
            {
                string katadi = Request.Form.Get("txtKategoriAdi").Trim();
                if (katadi == "")
                {
                    ViewBag.bos = true;
                }
                else
                {
                    var result = from k in vt.kategorilers where k.kategoriAdi == katadi select new { k.ID };
                    if (result.ToList().Count > 0)
                    {
                        ViewBag.var = true;
                    }
                    else
                    {
                        string urlKat = UrlTemizle(katadi);
                        kategoriler k = new kategoriler
                        {
                            kategoriAdi = katadi,
                            urlsefKatAdi = urlKat
                        };
                        vt.kategorilers.InsertOnSubmit(k);
                        vt.SubmitChanges();
                        ViewBag.eklendi = true;
                    }
                }
            }
            return View();
        }
        public ActionResult kategoriList()
        {
            return View(vt.kategorilers.ToList());
        }

        public ActionResult kategoriDuzenle(int id)
        {
            kategoriler k = vt.kategorilers.First(m => m.ID == id);
            return View(k);
        }
        [HttpPost]
        public ActionResult kategoriDuzenle(kategoriler k)
        {
            if (ModelState.IsValid)
            {
                var result = from kat in vt.kategorilers where kat.ID == k.ID select kat;
                foreach (var item in result)
                {
                    item.kategoriAdi = k.kategoriAdi;
                    item.urlsefKatAdi = k.urlsefKatAdi;
                }
                vt.SubmitChanges();
                return View("Basarili", k);
            }
            return View();
        }
        public ActionResult Basarili()
        {
            return View();

        }
        public ActionResult kategorisil(int id)
        {
            kategoriler k = vt.kategorilers.First(x => x.ID == id);
            return View(k);
        }
        [HttpPost]
        public ActionResult kategorisil(kategoriler k)
        {
            kategoriler katSil = vt.kategorilers.First(x => x.ID == k.ID);
            vt.kategorilers.DeleteOnSubmit(katSil);
            vt.SubmitChanges();
            return RedirectToAction("kategoriList");
        }
        public void kategoriler()
        {
            List<SelectListItem> kategorilerlist = new List<SelectListItem>();
            var kategorilersorgu = from k in vt.kategorilers select k;
            foreach (var item in kategorilersorgu)
            {
                kategorilerlist.Add(new SelectListItem { Text = item.kategoriAdi, Value = item.ID.ToString() });
            }
            ViewBag.kategoriler = kategorilerlist;
        }
        public void yazarlar()
        {
            List<SelectListItem> yazarlarlist = new List<SelectListItem>();
            var yazarlarsorgu = from k in vt.yoneticilers select new { k.adi, k.ID };
            foreach (var item in yazarlarsorgu)
            {
                yazarlarlist.Add(new SelectListItem { Text = item.adi, Value = item.ID.ToString() });
            }
            ViewBag.yazarlar = yazarlarlist;
        }
        public ActionResult MakaleEkle()
        {
            kategoriler();
            yazarlar();
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult MakaleEkle(FormCollection frm, HttpPostedFileBase file)
        {
            kategoriler();
            yazarlar();
            string makaleAdi = frm.Get("makaleAdi");
            int katid = Convert.ToInt32(frm.Get("kategoriler"));
            string makaleKisaAciklama = frm.Get("makaleKisaAciklama");
            string makale = frm.Get("makale");
            string makaleKeyword = frm.Get("makaleKeyword");
            string makaleDescription = frm.Get("makaleDescription");
            string makaleTitle = frm.Get("makaleTitle");
            int yazarid = Convert.ToInt32(frm.Get("yazarlar"));

            Random rnd = new Random();
            string sayi = rnd.Next(0, 999999999).ToString();
            var dosyaadi = Path.GetFileName(file.FileName);
            var dosya = Path.Combine(Server.MapPath("~/makaleresimler/" + sayi + dosyaadi));
            file.SaveAs(dosya);
            string dosyayolu = "~/makaleresimler/" + sayi + dosyaadi;

            makaleler makaleekle = new makaleler
            {
                makaleAdi = makaleAdi,
                kategoriID = katid,
                makaleKisaAciklama = makaleKisaAciklama,
                makale = makale,
                makaleKeyword = makaleKeyword,
                makaleDescription = makaleDescription,
                makaleTitle = makaleTitle,
                yazarID = yazarid,
                resim = dosyayolu
            };
            vt.makalelers.InsertOnSubmit(makaleekle);
            vt.SubmitChanges();
            ViewBag.basarili = "Makale eklenmistir";
            return View();
        }
        public ActionResult Makaleler(string id)
        {
            ViewBag.sayi = 0;
            var makaleQuery = from m in vt.makalelers join k in vt.kategorilers on m.kategoriID equals k.ID join y in vt.yoneticilers on m.yazarID equals y.ID select new { m.ID, m.makaleAdi, m.makaleDescription, m.makaleKeyword, m.makaleKisaAciklama, m.makale, m.makaleTitle, k.kategoriAdi, y.adi };
            double sayfa = Convert.ToDouble(id);
            if (sayfa == 0)
            {
                sayfa = 1;
            }
            ViewBag.sayfa = sayfa;
            double kacar = 2;
            double kactan = (sayfa * kacar) - kacar;
            double tamsayi = makaleQuery.Count();
            ViewBag.sayfasayisi = Math.Ceiling(tamsayi / kacar);

            if (makaleQuery.Count() > 0)
            {
                var query2 = makaleQuery.Skip(Convert.ToInt32(kactan)).Take(Convert.ToInt32(kacar));
                ViewBag.sayi = 1;
                List<makaleHelper> mlist = new List<makaleHelper>();
                foreach (var item in query2)
                {
                    makaleHelper makale = new makaleHelper();
                    makale.makaleID = item.ID;
                    makale.makaleAdi = item.makaleAdi;
                    makale.makaleDescription = item.makaleDescription;
                    makale.makaleTitle = item.makaleTitle;
                    makale.makaleKisaAciklama = item.makaleKisaAciklama;
                    makale.kategoriAdi = item.kategoriAdi;
                    makale.yazarAdi = item.adi;
                    makale.makale = item.makale;
                    makale.makaleKeyword = item.makaleKeyword;
                    mlist.Add(makale);
                }
                return View(mlist);
            }
            else
            {
                ViewBag.sayi = 0;
                return View();
            }
        }

        public ActionResult MakaleSil(int id)
        {
            if (id != null)
            {
                makaleler m = vt.makalelers.First(x => x.ID == id);
                vt.makalelers.DeleteOnSubmit(m);
                vt.SubmitChanges();
                ViewBag.silindi = "Makale Basariyla Silindi";
                Response.AppendHeader("Refresh", "2;url=../Makaleler");
                //return RedirectToAction("Makaleler", "Admin");
                return View();
            }
            return View();
        }
        public void KategorilerMakaleD(int id)
        {
            List<SelectListItem> kategorilerlist = new List<SelectListItem>();
            var kategorilersorgu = from k in vt.kategorilers select k;
            foreach (var item in kategorilersorgu)
            {
                if (id == item.ID)
                {
                    kategorilerlist.Add(new SelectListItem { Text = item.kategoriAdi, Value = item.ID.ToString(), Selected = true });

                }
                kategorilerlist.Add(new SelectListItem { Text = item.kategoriAdi, Value = item.ID.ToString() });
            }
            ViewBag.kategoriler = kategorilerlist;
        }

        public void yazarlarMakaleD(int id)
        {
            List<SelectListItem> yazarlarlist = new List<SelectListItem>();
            var yazarlarsorgu = from k in vt.yoneticilers select new { k.adi, k.ID };
            foreach (var item in yazarlarsorgu)
            {
                if (id == item.ID)
                {
                    yazarlarlist.Add(new SelectListItem { Text = item.adi, Value = item.ID.ToString(), Selected = true });
                }
                yazarlarlist.Add(new SelectListItem { Text = item.adi, Value = item.ID.ToString() });
            }
            ViewBag.yazarlar = yazarlarlist;
        }
        public ActionResult MakaleDuzenle(int id)
        {
            ViewBag.duzenle = "";
            var makaleD = vt.makalelers.First(x => x.ID == id);
            KategorilerMakaleD(Convert.ToInt32(makaleD.kategoriID));
            yazarlarMakaleD(Convert.ToInt32(makaleD.yazarID));
            return View(makaleD);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult makaleDuzenle(makaleler m, FormCollection frm)
        {
            int katid = Convert.ToInt32(frm.Get("kategoriler"));
            int yazarid = Convert.ToInt32(frm.Get("yazarlar"));

            var makaleD = vt.makalelers.First(x => x.ID == m.ID);
            makaleD.makaleAdi = m.makaleAdi;
            makaleD.makale = m.makale;
            makaleD.kategoriID = katid;
            makaleD.makaleTitle = m.makaleTitle;
            makaleD.makaleKeyword = m.makaleKeyword;
            makaleD.makaleDescription = m.makaleDescription;
            makaleD.yazarID = yazarid;
            vt.SubmitChanges();
            KategorilerMakaleD(katid);
            yazarlarMakaleD(yazarid);
            ViewBag.duzenle = "makale duzenlendi";

            return View();
        }


        public ActionResult yorumlar(string durum)
        {
            var yorumList = from y in vt.yorumlars join m in vt.makalelers on y.makaleID equals m.ID select new { m.makaleAdi, y.isim, y.mesaj, y.onay, y.email, y.ID };

            List<yorumhelper> yorumlarListe = new List<yorumhelper>();
            foreach (var item in yorumList)
            {
                yorumhelper yorum = new yorumhelper
                {
                    ID = item.ID,
                    email = item.email,
                    isim = item.isim,
                    makaleAdi = item.makaleAdi,
                    yorum = item.mesaj,
                    onay = Convert.ToInt32(item.onay)
                };
                yorumlarListe.Add(yorum);
            }
            if (!String.IsNullOrEmpty(durum))
            {
                if (durum == "onaykaldir")
                {
                    ViewBag.mesaj = "yorumun onayi kaldirildi";
                }
                else
                {
                    ViewBag.mesaj = "yorum onaylandi";
                }
            }

            return View(yorumlarListe);
        }
        [HttpGet]
        public ActionResult onaydurumu(string sayfa,string id)
        {
            int onay = 0;
            int ID = Convert.ToInt32(id);
            if (sayfa != "onaykaldir")
                onay = 1;

            var yorum = vt.yorumlars.FirstOrDefault(x => x.ID == ID);
            yorum.onay = onay;
            vt.SubmitChanges();

            if (sayfa == "onaykaldir")
                return RedirectToAction("yorumlar", new { durum = "onaykaldir" });
            else
                return RedirectToAction("yorumlar", new { durum = "onaylandi" });
        }

    }
}
