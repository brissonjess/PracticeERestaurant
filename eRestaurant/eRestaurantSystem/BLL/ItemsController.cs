using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using eRestaurantSystem.DAL;
using eRestaurantSystem.Data.Entities;
using eRestaurantSystem.Data.DTOs;
using eRestaurantSystem.Data.POCOs;
#endregion
namespace eRestaurantSystem.BLL
{
    [DataObject]
    public class ItemsController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<MenuCategoryFoodItemsDTO> MenuCategoryFoodItemsDTO_Get()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                              group food by new { food.MenuCategory.Description } into tempdataset
                              select new MenuCategoryFoodItemsDTO
                              {
                                  MenuCategoryDescription = tempdataset.Key.Description,

                                  FoodItems = (from x in tempdataset
                                              select new FoodItemCounts
                                              {
                                                  ItemID = x.ItemID,
                                                  FoodDescription = x.Description,
                                                  CurrentPrice = x.CurrentPrice,
                                                  TimesServed = x.BillItems.Count()
                                              }).ToList()
                              };
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsPOCO> MenuCategoryFoodItemsPOCO_Get()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                              orderby food.MenuCategory.Description
                              select new MenuCategoryFoodItemsPOCO
                              {

                                  MenuCategoryDescription = food.MenuCategory.Description,
                                  ItemID = food.ItemID,
                                  FoodDescription = food.Description,
                                  CurrentPrice = food.CurrentPrice,
                                  TimesServed = food.BillItems.Count()
                              };
                return results.ToList();
            }
        }
    }
}
