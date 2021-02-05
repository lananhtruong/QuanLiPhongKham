﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLPKDK.Models;
using Microsoft.AspNet.Identity;

namespace QLPKDK.Controllers
{
    public class LSKhamController : Controller
    {
        private QLPKDKEntities1 db = new QLPKDKEntities1();

        // GET: LSKham
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();//Lấy userId của logged in user
            var prescriptions = db.Prescriptions.Where(d => d.Customer.UserId == userId)
                .Include(p => p.Customer).Include(p => p.Employee).Include(p => p.Employee1);
            return View(prescriptions.ToList());
        }

        // GET: LSKham/Details/5
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

        // GET: LSKham/Create
        public ActionResult Create()
        {
            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name");
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name");
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: LSKham/Create
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

            ViewBag.Customer_id = new SelectList(db.Customers, "Id", "Name", prescription.Customer_id);
            ViewBag.Doctor_id = new SelectList(db.Employees, "Id", "Name", prescription.Doctor_id);
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // GET: LSKham/Edit/5
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
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // POST: LSKham/Edit/5
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
            ViewBag.Mediator_id = new SelectList(db.Employees, "Id", "Name", prescription.Mediator_id);
            return View(prescription);
        }

        // GET: LSKham/Delete/5
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

        // POST: LSKham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Prescription prescription = db.Prescriptions.Find(id);
            db.Prescriptions.Remove(prescription);
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
