# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Unit.delete_all
Unit.create([
  { name: 'gram', abbv: 'g' },
  { name: 'international unit', abbv: 'IU' },
  { name: 'kilocalorie', abbv: 'kcal' },
  { name: 'kilojoule', abbv: 'kj' },
  { name: 'microgram', abbv: 'mcg' },
  { name: 'microgram of Dietary Folate. Equivalent', abbv: 'mcg DFE' },
  { name: 'microgram of Retinol Activity Equivalents', abbv: 'mcg RAE' },
  { name: 'milligram', abbv: 'mg' },
  { name: 'milliliter', abbv: 'ml' },
  { name: 'each', abbv: 'ea' },
  { name: 'cup', abbv: 'c' },
  { name: 'fluid ounce', abbv: 'fl oz' },
  { name: 'gallon', abbv: 'gal' },
  { name: 'inch', abbv: 'in' },
  { name: 'pint', abbv: 'pt' },
  { name: 'pound', abbv: 'lb' },
  { name: 'quart', abbv: 'qt' },
  { name: 'teaspoon', abbv: 'tsp' },
  { name: 'tablespoon', abbv: 'tbs' },
  { name: 'pinch', abbv: 'pinch' },
  { name: 'slice', abbv: 'slice' },
  { name: 'liter', abbv: 'l' }
])

FoodGroup.delete_all
FoodGroup.create([
  { name: 'Dairy and Egg Products' },
  { name: 'Spices and Herbs' },
  { name: 'Baby Foods' },
  { name: 'Fats and Oils' },
  { name: 'Poultry Products' },
  { name: 'Soups, Sauces, and Gravies' },
  { name: 'Sausages and Luncheon Meats' },
  { name: 'Breakfast Cereals' },
  { name: 'Fruits and Fruit Juices' },
  { name: 'Pork Products' },
  { name: 'Vegetables and Vegetable Products' },
  { name: 'Nut and Seed Products' },
  { name: 'Beef Products' },
  { name: 'Beverages' },
  { name: 'Finfish and Shellfish Products' },
  { name: 'Legumes and Legume Products' },
  { name: 'Lamb, Veal, and Game Products' },
  { name: 'Baked Products' },
  { name: 'Sweets' },
  { name: 'Cereal Grains and Pasta' },
  { name: 'Fast Foods' },
  { name: 'Meals, Entrees, and Sidedishes' },
  { name: 'Snacks' },
  { name: 'Ethnic Foods' }
])

[
{ name: 'Protein', abbv: 'PROCNT', daily_base: '0.000', unit: 'g' },
{ name: 'Total lipid (fat)', abbv: 'FAT', daily_base: '0.000', unit: 'g' },
{ name: 'Carbohydrate, by difference', abbv: 'CHOCDF', daily_base: '0.000', unit: 'g' },
{ name: 'Ash', abbv: 'ASH', daily_base: '0.000', unit: 'g' },
{ name: 'Energy', abbv: 'ENERC_KCAL', daily_base: '0.000', unit: 'kcal' },
{ name: 'Starch', abbv: 'STARCH', daily_base: '0.000', unit: 'g' },
{ name: 'Sucrose', abbv: 'SUCS', daily_base: '0.000', unit: 'g' },
{ name: 'Glucose (dextrose)', abbv: 'GLUS', daily_base: '0.000', unit: 'g' },
{ name: 'Fructose', abbv: 'FRUS', daily_base: '0.000', unit: 'g' },
{ name: 'Lactose', abbv: 'LACS', daily_base: '0.000', unit: 'g' },
{ name: 'Maltose', abbv: 'MALS', daily_base: '0.000', unit: 'g' },
{ name: 'Alcohol, ethyl', abbv: 'ALC', daily_base: '0.000', unit: 'g' },
{ name: 'Water', abbv: 'WATER', daily_base: '0.000', unit: 'g' },
{ name: 'Adjusted Protein', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: 'Caffeine', abbv: 'CAFFN', daily_base: '0.000', unit: 'mg' },
{ name: 'Theobromine', abbv: 'THEBRN', daily_base: '0.000', unit: 'mg' },
{ name: 'Energy', abbv: 'ENERC_KJ', daily_base: '0.000', unit: 'kj' },
{ name: 'Sugars, total', abbv: 'SUGAR', daily_base: '0.000', unit: 'g' },
{ name: 'Galactose', abbv: 'GALS', daily_base: '0.000', unit: 'g' },
{ name: 'Fiber, total dietary', abbv: 'FIBTG', daily_base: '0.000', unit: 'g' },
{ name: 'Calcium, Ca', abbv: 'CA', daily_base: '1000.000', unit: 'mg' },
{ name: 'Iron, Fe', abbv: 'FE', daily_base: '18.000', unit: 'mg' },
{ name: 'Magnesium, Mg', abbv: 'MG', daily_base: '0.000', unit: 'mg' },
{ name: 'Phosphorus, P', abbv: 'P', daily_base: '700.000', unit: 'mg' },
{ name: 'Potassium, K', abbv: 'K', daily_base: '0.000', unit: 'mg' },
{ name: 'Sodium, Na', abbv: 'NA', daily_base: '0.000', unit: 'mg' },
{ name: 'Zinc, Zn', abbv: 'ZN', daily_base: '11.000', unit: 'mg' },
{ name: 'Copper, Cu', abbv: 'CU', daily_base: '0.000', unit: 'mg' },
{ name: 'Fluoride, F', abbv: 'FLD', daily_base: '0.000', unit: 'mcg' },
{ name: 'Manganese, Mn', abbv: 'MN', daily_base: '0.000', unit: 'mg' },
{ name: 'Selenium, Se', abbv: 'SE', daily_base: '0.000', unit: 'mcg' },
{ name: 'Vitamin A, IU', abbv: 'VITA_IU', daily_base: '3000.000', unit: 'IU' },
{ name: 'Retinol', abbv: 'RETOL', daily_base: '0.000', unit: 'mcg' },
{ name: 'Vitamin A, RAE', abbv: 'VITA_RAE', daily_base: '900.000', unit: 'mcg RAE' },
{ name: 'Carotene, beta', abbv: 'CARTB', daily_base: '0.000', unit: 'mcg' },
{ name: 'Carotene, alpha', abbv: 'CARTA', daily_base: '0.000', unit: 'mcg' },
{ name: 'Vitamin E (alpha-tocopherol)', abbv: 'TOCPHA', daily_base: '15.000', unit: 'mg' },
{ name: 'Vitamin D', abbv: 'VITD-', daily_base: '200.000', unit: 'IU' },
{ name: 'Cryptoxanthin, beta', abbv: 'CRYPX', daily_base: '0.000', unit: 'mcg' },
{ name: 'Lycopene', abbv: 'LYCPN', daily_base: '0.000', unit: 'mcg' },
{ name: 'Lutein + zeaxanthin', abbv: 'LUT+ZEA', daily_base: '0.000', unit: 'mcg' },
{ name: 'Tocopherol, beta', abbv: 'TOCPHB', daily_base: '0.000', unit: 'mg' },
{ name: 'Tocopherol, gamma', abbv: 'TOCPHG', daily_base: '0.000', unit: 'mg' },
{ name: 'Tocopherol, delta', abbv: 'TOCPHD', daily_base: '0.000', unit: 'mg' },
{ name: 'Vitamin C, total ascorbic acid', abbv: 'VITC', daily_base: '90.000', unit: 'mg' },
{ name: 'Thiamin', abbv: 'THIA', daily_base: '1.200', unit: 'mg' },
{ name: 'Riboflavin', abbv: 'RIBF', daily_base: '1.300', unit: 'mg' },
{ name: 'Niacin', abbv: 'NIA', daily_base: '16.000', unit: 'mg' },
{ name: 'Pantothenic acid', abbv: 'PANTAC', daily_base: '0.000', unit: 'mg' },
{ name: 'Vitamin B-6', abbv: 'VITB6A', daily_base: '1.300', unit: 'mg' },
{ name: 'Folate, total', abbv: 'FOL', daily_base: '400.000', unit: 'mcg' },
{ name: 'Vitamin B-12', abbv: 'VITB12', daily_base: '2.400', unit: 'mcg' },
{ name: 'Choline, total', abbv: 'CHOLN', daily_base: '0.000', unit: 'mg' },
{ name: 'Vitamin K (phylloquinone)', abbv: 'VITK', daily_base: '0.000', unit: 'mcg' },
{ name: 'Folic acid', abbv: 'FOLAC', daily_base: '400.000', unit: 'mcg' },
{ name: 'Folate, food', abbv: 'FOLFD', daily_base: '0.000', unit: 'mcg' },
{ name: 'Folate, DFE', abbv: 'FOLDFE', daily_base: '0.000', unit: 'mcg DFE' },
{ name: 'Betaine', abbv: 'BETN', daily_base: '0.000', unit: 'mg' },
{ name: 'Tryptophan', abbv: 'TRP_G', daily_base: '0.000', unit: 'g' },
{ name: 'Threonine', abbv: 'THR_G', daily_base: '0.000', unit: 'g' },
{ name: 'Isoleucine', abbv: 'ILE_G', daily_base: '0.000', unit: 'g' },
{ name: 'Leucine', abbv: 'LEU_G', daily_base: '0.000', unit: 'g' },
{ name: 'Lysine', abbv: 'LYS_G', daily_base: '0.000', unit: 'g' },
{ name: 'Methionine', abbv: 'MET_G', daily_base: '0.000', unit: 'g' },
{ name: 'Cystine', abbv: 'CYS_G', daily_base: '0.000', unit: 'g' },
{ name: 'Phenylalanine', abbv: 'PHE_G', daily_base: '0.000', unit: 'g' },
{ name: 'Tyrosine', abbv: 'TYR_G', daily_base: '0.000', unit: 'g' },
{ name: 'Valine', abbv: 'VAL_G', daily_base: '0.000', unit: 'g' },
{ name: 'Arginine', abbv: 'ARG_G', daily_base: '0.000', unit: 'g' },
{ name: 'Histidine', abbv: 'HISTN_G', daily_base: '0.000', unit: 'g' },
{ name: 'Alanine', abbv: 'ALA_G', daily_base: '0.000', unit: 'g' },
{ name: 'Aspartic acid', abbv: 'ASP_G', daily_base: '0.000', unit: 'g' },
{ name: 'Glutamic acid', abbv: 'GLU_G', daily_base: '0.000', unit: 'g' },
{ name: 'Glycine', abbv: 'GLY_G', daily_base: '0.000', unit: 'g' },
{ name: 'Proline', abbv: 'PRO_G', daily_base: '0.000', unit: 'g' },
{ name: 'Serine', abbv: 'SER_G', daily_base: '0.000', unit: 'g' },
{ name: 'Hydroxyproline', abbv: 'HYP', daily_base: '0.000', unit: 'g' },
{ name: 'Vitamin E, added', abbv: '', daily_base: '0.000', unit: 'mg' },
{ name: 'Vitamin B-12, added', abbv: '', daily_base: '0.000', unit: 'mcg' },
{ name: 'Cholesterol', abbv: 'CHOLE', daily_base: '0.000', unit: 'mg' },
{ name: 'Fatty acids, total trans', abbv: 'FATRN', daily_base: '0.000', unit: 'g' },
{ name: 'Fatty acids, total saturated', abbv: 'FASAT', daily_base: '0.000', unit: 'g' },
{ name: '4:0', abbv: 'F4D0', daily_base: '0.000', unit: 'g' },
{ name: '6:0', abbv: 'F6D0', daily_base: '0.000', unit: 'g' },
{ name: '8:0', abbv: 'F8D0', daily_base: '0.000', unit: 'g' },
{ name: '10:0', abbv: 'F10D0', daily_base: '0.000', unit: 'g' },
{ name: '12:0', abbv: 'F12D0', daily_base: '0.000', unit: 'g' },
{ name: '14:0', abbv: 'F14D0', daily_base: '0.000', unit: 'g' },
{ name: '16:0', abbv: 'F16D0', daily_base: '0.000', unit: 'g' },
{ name: '18:0', abbv: 'F18D0', daily_base: '0.000', unit: 'g' },
{ name: '20:0', abbv: 'F20D0', daily_base: '0.000', unit: 'g' },
{ name: '18:1 undifferentiated', abbv: 'F18D1', daily_base: '0.000', unit: 'g' },
{ name: '18:2 undifferentiated', abbv: 'F18D2', daily_base: '0.000', unit: 'g' },
{ name: '18:3 undifferentiated', abbv: 'F18D3', daily_base: '0.000', unit: 'g' },
{ name: '20:4 undifferentiated', abbv: 'F20D4', daily_base: '0.000', unit: 'g' },
{ name: '22:6 n-3', abbv: 'F22D6', daily_base: '0.000', unit: 'g' },
{ name: '22:0', abbv: 'F22D0', daily_base: '0.000', unit: 'g' },
{ name: '14:1', abbv: 'F14D1', daily_base: '0.000', unit: 'g' },
{ name: '16:1 undifferentiated', abbv: 'F16D1', daily_base: '0.000', unit: 'g' },
{ name: '18:4', abbv: 'F18D4', daily_base: '0.000', unit: 'g' },
{ name: '20:1', abbv: 'F20D1', daily_base: '0.000', unit: 'g' },
{ name: '20:5 n-3', abbv: 'F20D5', daily_base: '0.000', unit: 'g' },
{ name: '22:1 undifferentiated', abbv: 'F22D1', daily_base: '0.000', unit: 'g' },
{ name: '22:5 n-3', abbv: 'F22D5', daily_base: '0.000', unit: 'g' },
{ name: 'Phytosterols', abbv: 'PHYSTR', daily_base: '0.000', unit: 'mg' },
{ name: 'Stigmasterol', abbv: 'STID7', daily_base: '0.000', unit: 'mg' },
{ name: 'Campesterol', abbv: 'CAMD5', daily_base: '0.000', unit: 'mg' },
{ name: 'Beta-sitosterol', abbv: 'SITSTR', daily_base: '0.000', unit: 'mg' },
{ name: 'Fatty acids, total monounsaturated', abbv: 'FAMS', daily_base: '0.000', unit: 'g' },
{ name: 'Fatty acids, total polyunsaturated', abbv: 'FAPU', daily_base: '0.000', unit: 'g' },
{ name: '15:0', abbv: 'F15D0', daily_base: '0.000', unit: 'g' },
{ name: '17:0', abbv: 'F17D0', daily_base: '0.000', unit: 'g' },
{ name: '24:0', abbv: 'F24D0', daily_base: '0.000', unit: 'g' },
{ name: '16:1 t', abbv: 'F16D1T', daily_base: '0.000', unit: 'g' },
{ name: '18:1 t', abbv: 'F18D1T', daily_base: '0.000', unit: 'g' },
{ name: '22:1 t', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: '18:2 t not further defined', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: '18:2 i', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: '18:2 t,t', abbv: 'F18D2TT', daily_base: '0.000', unit: 'g' },
{ name: '18:2 CLAs', abbv: 'F18D2CLA', daily_base: '0.000', unit: 'g' },
{ name: '24:1 c', abbv: 'F24D1C', daily_base: '0.000', unit: 'g' },
{ name: '20:2 n-6 c,c', abbv: 'F20D2CN6', daily_base: '0.000', unit: 'g' },
{ name: '16:1 c', abbv: 'F16D1C', daily_base: '0.000', unit: 'g' },
{ name: '18:1 c', abbv: 'F18D1C', daily_base: '0.000', unit: 'g' },
{ name: '18:2 n-6 c,c', abbv: 'F18D2CN6', daily_base: '0.000', unit: 'g' },
{ name: '22:1 c', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: '18:3 n-6 c,c,c', abbv: 'F18D3CN6', daily_base: '0.000', unit: 'g' },
{ name: '17:1', abbv: 'F17D1', daily_base: '0.000', unit: 'g' },
{ name: '20:3 undifferentiated', abbv: 'F20D3', daily_base: '0.000', unit: 'g' },
{ name: 'Fatty acids, total trans-monoenoic', abbv: 'FATRNM', daily_base: '0.000', unit: 'g' },
{ name: 'Fatty acids, total trans-polyenoic', abbv: 'FATRNP', daily_base: '0.000', unit: 'g' },
{ name: '13:0', abbv: 'F13D0', daily_base: '0.000', unit: 'g' },
{ name: '15:1', abbv: 'F15D1', daily_base: '0.000', unit: 'g' },
{ name: '18:3 n-3 c,c,c', abbv: 'F18D3CN3', daily_base: '0.000', unit: 'g' },
{ name: '20:3 n-3', abbv: 'F20D3N3', daily_base: '0.000', unit: 'g' },
{ name: '20:3 n-6', abbv: 'F20D3N6', daily_base: '0.000', unit: 'g' },
{ name: '20:4 n-6', abbv: 'F20D4N6', daily_base: '0.000', unit: 'g' },
{ name: '18:3i', abbv: '', daily_base: '0.000', unit: 'g' },
{ name: '21:5', abbv: 'F21D5', daily_base: '0.000', unit: 'g' },
{ name: '22:4', abbv: 'F22D4', daily_base: '0.000', unit: 'g' }
].each { |nutrient|
  unit = Unit.find_by_abbv(nutrient[:unit])
  nutrient[:unit] = unit
  Nutrient.create(nutrient)
}
