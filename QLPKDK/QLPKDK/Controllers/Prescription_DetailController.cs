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
    public class Prescription_DetailController : Controller
    {
        private QLPKDKEntities1 db = new QLPKDKEntities1();

        // GET: Prescription_Detail
        public ActionResult Index()
        {
            var prescription_Detail = db.Prescription_Detail.Include(p => p.Medicine).Include(p => p.Prescription);
            return View(prescription_Detail.ToList());
        }

        // GET: Prescription_Detail/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription_Detail prescription_Detail = db.Prescription_Detail.Find(id);
            if (prescription_Detail == null)
            {
                return HttpNotFound();
            }
            return View(prescription_Detail);
        }

        // GET: Prescription_Detail/Create
        public ActionResult Create()
        {
            ViewBag.Medicine_id = new SelectList(db.Medicines, "Id", "Code_medicine");
            ViewBag.Prescription_id = new SelectList(db.Prescriptions, "Id", "Note");
            return View();
        }

        // POST: Prescription_Detail/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Prescription_id,Medicine_id,Quanlity,Morning,Noon,Afternoon,Night,Note")] Prescription_Detail prescription_Detail)
        {
            if (ModelState.IsValid)
            {
                db.Prescription_Detail.Add(prescription_Detail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Medicine_id = new SelectList(db.Medicines, "Id", "Code_medicine", prescription_Detail.Medicine_id);
            ViewBag.Prescription_id = new SelectList(db.Prescriptions, "Id", "Note", prescription_Detail.Prescription_id);
            return View(prescription_Detail);
        }

        // GET: Prescription_Detail/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription_Detail prescription_Detail = db.Prescription_Detail.Find(id);
            if (prescription_Detail == null)
            {
                return HttpNotFound();
            }
            ViewBag.Medicine_id = new SelectList(db.Medicines, "Id", "Code_medicine", prescription_Detail.Medicine_id);
            ViewBag.Prescription_id = new SelectList(db.Prescriptions, "Id", "Note", prescription_Detail.Prescription_id);
            return View(prescription_Detail);
        }

        // POST: Prescription_Detail/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Prescription_id,Medicine_id,Quanlity,Morning,Noon,Afternoon,Night,Note")] Prescription_Detail prescription_Detail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prescription_Detail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Medicine_id = new SelectList(db.Medicines, "Id", "Code_medicine", prescription_Detail.Medicine_id);
            ViewBag.Prescription_id = new SelectList(db.Prescriptions, "Id", "Note", prescription_Detail.Prescription_id);
            return View(prescription_Detail);
        }

        // GET: Prescription_Detail/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Prescription_Detail prescription_Detail = db.Prescription_Detail.Find(id);
            if (prescription_Detail == null)
            {
                return HttpNotFound();
            }
            return View(prescription_Detail);
        }

        // POST: Prescription_Detail/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prescription_Detail prescription_Detail = db.Prescription_Detail.Find(id);
            db.Prescription_Detail.Remove(prescription_Detail);
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
