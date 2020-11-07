using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.ProductDTO
{
    public class ProductDTO
    {
        public Guid productId { get; set; }
        public string productName { get; set; }
        public float productPrice { get; set; }
        public float productDiscount { get; set; }
        public float discountPercentage { get; set; }
        public float productDiscountPrice { get; set; }
        public int quantity { get; set; }

        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
