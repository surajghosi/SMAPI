using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.ProductModel
{
    public class ProductModel
    {
        public Guid productId { get; set; }
        [Required]
        public string productName { get; set; }
        [Required]
        public float productPrice { get; set; }
        [Required]
        public float productDiscount { get; set; }
        [Required]
        public float discountPercentage { get; set; }
        [Required]
        public float productDiscountPrice { get; set; }
        [Required]
        public int quantity { get; set; }

        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
