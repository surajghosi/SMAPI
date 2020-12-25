using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.ProductDTO;

namespace TMS.Dapper.Services
{
    public class ProductService : RepositoryBase, IProduct
    {
        public ProductService(IDbTransaction transaction)
         : base(transaction)
        {
        }

        public async Task<string> AddProductAsync(ProductDTO _obj)
        {
            try
            {

                var query = "ADDPRODUCT";
                var param = new DynamicParameters();
                param.Add("@productName", _obj.productName);
                param.Add("@productprice", _obj.productPrice);
                param.Add("@productDiscount", _obj.productDiscount);
                param.Add("@discountpercentage", _obj.discountPercentage);
                param.Add("@quantity", _obj.quantity);
                param.Add("@leadid", _obj.leadId);
                param.Add("@createdBy   ", _obj.createdBy);
                object Result = await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToString();


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeleteProductAsync(Guid productId, Guid modifiedBy)
        {
            try
            {

                var query = "DeleteProduct";
                var param = new DynamicParameters();
                param.Add("@productId", productId);
                param.Add("@modifiedBy", modifiedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<ProductDTO>> getAllProductAsync(Guid leadId)
        {
            try
            {
                var query = "GetAllProduct";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                var Result = await Connection.QueryAsync<ProductDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
