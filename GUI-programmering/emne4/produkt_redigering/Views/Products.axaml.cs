using System.Collections.ObjectModel;
using Avalonia.Controls;
using produkt_redigering.ViewModels;

namespace produkt_redigering.Views;

public partial class Products : UserControl
{
    public Products()
    {
        InitializeComponent();

        this.List = new ProductsViewModel().Products;
        
        DataContext = this;
    }

    public ObservableCollection<Models.Product> List { get; }
}