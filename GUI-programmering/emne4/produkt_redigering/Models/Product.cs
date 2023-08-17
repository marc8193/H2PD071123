using System;

namespace produkt_redigering.Models;

public class Product
{
  public Product(string ProductName, string ProductDesc, decimal SalesPrice, 
                 decimal PurchasePrice, float Stock, Units Unit, bool Hidden, DateTime CampaignEnd)
  {
    this.ProductName = ProductName;
    this.ProductDesc = ProductDesc;
    this.SalesPrice = SalesPrice;
    this.PurchasePrice = PurchasePrice;
    this.Stock = Stock;
    this.Unit = Unit;
    this.Hidden = Hidden;
    this.CampaignEnd = CampaignEnd;
  }

  public enum Units
  {
    cm,
    kg,
    stk,
  }

  public string ProductName { get; set; }
  public string ProductDesc { get; set; }
  public decimal SalesPrice { get; set; }
  public decimal PurchasePrice { get; set; }
  public float Stock { get; set; }
  public Units Unit { get; set; }
  public bool Hidden { get; set; }
  public DateTime CampaignEnd { get; set; }
  
}