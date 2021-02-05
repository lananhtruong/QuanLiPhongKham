using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using QLPKDK.Models;

namespace QLPKDK.Controllers
{
    public class QuayThuocController : Controller
    {
        private QLPKDKEntities1 db = new QLPKDKEntities1();
        private Dictionary<int, string> dict = new Dictionary<int, string>()
            {
                {1, "Chưa phát thuốc"},
                {2, "Đã phát thuốc"}
            };

        // GET: QuayThuoc
        public ActionResult Index(DateTime? date = null, int status = 1)
        {
            DateTime dateObj = date ?? DateTime.Today;

            ViewBag.date = dateObj.ToString("yyyy-MM-dd");
            ViewBag.status_list = new SelectList(dict, "Key", "Value", status);
            ViewBag.dict = dict;

            //Status = 0 (chưa khám), 1 (đã khám nhưng chưa phát thuốc), 2 (đã phát thuốc)
            //Lấy những toa thuốc đã khám nhưng chưa phát thuốc
            var don_thuoc = db.Prescriptions.Where(d => d.Status == status && d.Date == dateObj)
                .Include(d => d.Customer).Include(d => d.Employee).Include(d => d.Employee1);
            return View(don_thuoc.ToList());
        }

        // GET: QuayThuoc/PhatThuoc/5
        public ActionResult PhatThuoc(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription don_thuoc = db.Prescriptions.Find(id);
            if (don_thuoc == null)
            {
                return HttpNotFound();
            }
            var userId = User.Identity.GetUserId();
            ViewBag.MediatorName = db.Employees.Where(e => e.UserId == userId).FirstOrDefault().Name;
            ViewBag.dict = dict;
            return View(don_thuoc);
        }

        public ActionResult HoanThanhPhatThuoc(int id)
        {
            //Lấy ra userId của user đã đăng nhập
            var userId = User.Identity.GetUserId();
            //Lấy ra id của user đã đăng nhập
            var mediator_id = db.Employees.Where(e => e.UserId == userId).FirstOrDefault().Id;

            Prescription don_thuoc = db.Prescriptions.Find(id);
            don_thuoc.Status = 2;//2 có nghĩa là đã phát thuốc xong
            don_thuoc.Mediator_id = mediator_id;//Lưu id của nhân viên phát thuốc
            db.Entry(don_thuoc).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
