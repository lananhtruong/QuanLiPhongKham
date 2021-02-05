using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLPKDK.Models;

namespace QLPKDK.Controllers
{
    public class PrescriptionController : Controller
    {
        private QLPKDKEntities1 db = new QLPKDKEntities1();
        // GET: Prescription
        public ActionResult Index()
        {
            var don_thuoc = db.Prescriptions.Include(d => d.Customer).Include(d => d.Employee).Include(d => d.Employee1);
            return View(don_thuoc.ToList());
        }

        // GET: Prescription/Details/5
        public ActionResult Details(int? id)
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
            return View(don_thuoc);
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

        // GET: don_thuoc/Create
        public ActionResult Create()
        {
            //ViewBag.benh_nhan_id = new SelectList(db.benh_nhan, "id", "ho");
            ViewBag.Customer_id = new SelectList(db.Customers.Select(bn => new { id = bn.Id, hoten = bn.Name}), "id", "hoten");
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name");
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: don_thuoc/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Date,Customer_id,Doctor_id,Mediator_id,Status,Note")] Prescription don_thuoc)
        {
            if (ModelState.IsValid)
            {
                db.Prescriptions.Add(don_thuoc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.benh_nhan_id = new SelectList(db.benh_nhan, "id", "ho", don_thuoc.benh_nhan_id);
            ViewBag.Customer_id = new SelectList(db.Customers.Select(bn => new { id = bn.Id, hoten = bn.Name}), "id", "hoten", don_thuoc.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Doctor_id);
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Mediator_id);
            return View(don_thuoc);
        }

        // GET: don_thuoc/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name", don_thuoc.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Doctor_id);
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Mediator_id);
            return View(don_thuoc);
        }

        // POST: don_thuoc/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Date,Customer_id,Doctor_id,Mediator_id,Status,Note")] Prescription don_thuoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(don_thuoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name", don_thuoc.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Doctor_id);
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", don_thuoc.Mediator_id);
            return View(don_thuoc);
        }

        // GET: don_thuoc/Delete/5
        public ActionResult Delete(int? id)
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
            return View(don_thuoc);
        }

        // POST: don_thuoc/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prescription don_thuoc = db.Prescriptions.Find(id);
            db.Prescriptions.Remove(don_thuoc);
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
