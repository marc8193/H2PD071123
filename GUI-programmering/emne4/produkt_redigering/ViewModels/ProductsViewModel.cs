using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using produkt_redigering.Models;

namespace produkt_redigering.ViewModels;

public class ProductsViewModel : ViewModelBase
{
  public ProductsViewModel()
  {
    var products = new List<Product>();

    var product = new Product("Lenovo ThinkPad P14", "Laptop", 2000, 1500, 20, 
                              Product.Units.stk, false, DateTime.Now);

    products.Add(product);

    this.Products = new ObservableCollection<Product>(products);
  }

  public ObservableCollection<Product> Products { get; }  
}
