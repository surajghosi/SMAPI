using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.ProductDTO;

namespace TMS.Dapper.Interface
{
    public interface IProduct
    {
        Task<string> AddProductAsync(ProductDTO _obj);
        Task DeleteProductAsync(Guid productId, Guid modifiedBy);

        Task<List<ProductDTO>> getAllProductAsync(Guid leadId);
    }
}
