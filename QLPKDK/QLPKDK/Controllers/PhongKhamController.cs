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
    public class PhongKhamController : Controller
    {
        private QLPKDKEntities1 db = new QLPKDKEntities1();

        // GET: PhongKham
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();//Lấy userId của logged in user
            //Status = 0 (chưa khám), 1 (đã khám nhưng chưa phát thuốc), 2 (đã phát thuốc)
            var prescriptions = db.Prescriptions.Where(d => d.Employee.UserId == userId && d.Status == 0)
                .Include(p => p.Customer).Include(p => p.Employee).Include(p => p.Employee1);
            return View(prescriptions.ToList());
        }

        // GET: PhongKham/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription prescription = db.Prescriptions.Find(id);
            if (prescription == null)
            {
                return HttpNotFound();
            }
            return View(prescription);
        }

        public ActionResult Kham(int? id)
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
            var thuocs = db.Medicines.Select(x => new { Id = x.Id, Name = x.Name + " (" + x.Unit_measurement + ")" });
            ViewBag.Medicine_id = new SelectList(thuocs, "Id", "Name");
            ViewBag.don_thuoc = don_thuoc;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Kham([Bind(Include = "Id,Prescription_id,Medicine_id,Quanlity,Morning,Noon,Afternoon,Night,Note")] Prescription_Detail don_thuoc_chi_tiet)
        {
            if (ModelState.IsValid)
            {
                db.Prescription_Detail.Add(don_thuoc_chi_tiet);
                db.SaveChanges();
                return RedirectToAction("Kham", new { id = don_thuoc_chi_tiet.Prescription_id });
            }

            var thuocs = db.Medicines.Select(x => new { Id = x.Id, Name = x.Name + " (" + x.Unit_measurement + ")" });
            ViewBag.Medicine_id = new SelectList(thuocs, "Id", "Name");
            ViewBag.don_thuoc = db.Prescriptions.Find(don_thuoc_chi_tiet.Prescription_id);
            return View();
        }

        // GET: PhongKham/Create
        public ActionResult Create()
        {
            ViewBag.Customer_id = new SelectList(db.Customers.Select(bn => new { id = bn.Id, hoten = bn.Name }), "id", "hoten");
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name");
            //ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: PhongKham/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Date,Customer_id,Doctor_id,Mediator_id,Status,Note")] Prescription prescription)
        {
            if (ModelState.IsValid)
            {
                db.Prescriptions.Add(prescription);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Customer_id = new SelectList(db.Customers.Select(bn => new { id = bn.Id, hoten = bn.Name }), "id", "hoten", prescription.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", prescription.Doctor_id);
            //ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // GET: PhongKham/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription prescription = db.Prescriptions.Find(id);
            if (prescription == null)
            {
                return HttpNotFound();
            }
            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name", prescription.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", prescription.Doctor_id);
            //ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // POST: PhongKham/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Date,Customer_id,Doctor_id,Mediator_id,Status,Note")] Prescription prescription)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prescription).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name", prescription.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", prescription.Doctor_id);
            //ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // GET: PhongKham/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription prescription = db.Prescriptions.Find(id);
            if (prescription == null)
            {
                return HttpNotFound();
            }
            return View(prescription);
        }

        // POST: PhongKham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prescription prescription = db.Prescriptions.Find(id);
            db.Prescriptions.Remove(prescription);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ChuyenPhatThuoc(int id)
        {
            Prescription prescription = db.Prescriptions.Find(id);
            if (prescription == null)
            {
                return HttpNotFound();
            }
            prescription.Status = 1;//1 đã khám nhưng chưa phát thuốc
            db.Entry(prescription).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
