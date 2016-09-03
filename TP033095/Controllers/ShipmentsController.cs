using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TP033095;

namespace TP033095.Controllers
{
    public class ShipmentsController : Controller
    {
        private ERDContainer db = new ERDContainer();

        // GET: Shipments
        public ActionResult Index()
        {
            var shipments = db.Shipments.Include(s => s.Yard).Include(s => s.Customer).Include(s => s.Ship);
            return View(shipments.ToList());
        }

        // GET: Shipments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shipment shipment = db.Shipments.Find(id);
            if (shipment == null)
            {
                return HttpNotFound();
            }
            return View(shipment);
        }

        // GET: Shipments/Create
        public ActionResult Create()
        {
            ViewBag.Yard_yardId = new SelectList(db.Yards, "yardId", "yardName");
            ViewBag.Customer_customerId = new SelectList(db.Customers, "customerId", "customerName");
            ViewBag.Ship_shipId = new SelectList(db.Ships, "shipId", "shipName");
            return View();
        }

        // POST: Shipments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "shipmentId,shipmentType,shipmentInsuredValue,shipmentWeight,shipmentDestination,shipmentStatus,Yard_yardId,Customer_customerId,Ship_shipId")] Shipment shipment)
        {
            if (ModelState.IsValid)
            {
                db.Shipments.Add(shipment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Yard_yardId = new SelectList(db.Yards, "yardId", "yardName", shipment.Yard_yardId);
            ViewBag.Customer_customerId = new SelectList(db.Customers, "customerId", "customerName", shipment.Customer_customerId);
            ViewBag.Ship_shipId = new SelectList(db.Ships, "shipId", "shipName", shipment.Ship_shipId);
            return View(shipment);
        }

        // GET: Shipments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shipment shipment = db.Shipments.Find(id);
            if (shipment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Yard_yardId = new SelectList(db.Yards, "yardId", "yardName", shipment.Yard_yardId);
            ViewBag.Customer_customerId = new SelectList(db.Customers, "customerId", "customerName", shipment.Customer_customerId);
            ViewBag.Ship_shipId = new SelectList(db.Ships, "shipId", "shipName", shipment.Ship_shipId);
            return View(shipment);
        }

        // POST: Shipments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "shipmentId,shipmentType,shipmentInsuredValue,shipmentWeight,shipmentDestination,shipmentStatus,Yard_yardId,Customer_customerId,Ship_shipId")] Shipment shipment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shipment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Yard_yardId = new SelectList(db.Yards, "yardId", "yardName", shipment.Yard_yardId);
            ViewBag.Customer_customerId = new SelectList(db.Customers, "customerId", "customerName", shipment.Customer_customerId);
            ViewBag.Ship_shipId = new SelectList(db.Ships, "shipId", "shipName", shipment.Ship_shipId);
            return View(shipment);
        }

        // GET: Shipments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shipment shipment = db.Shipments.Find(id);
            if (shipment == null)
            {
                return HttpNotFound();
            }
            return View(shipment);
        }

        // POST: Shipments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Shipment shipment = db.Shipments.Find(id);
            db.Shipments.Remove(shipment);
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
