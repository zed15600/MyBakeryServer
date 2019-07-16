Expenditure.create!([
  {date: "2019-06-16", total_value: 68800},
  {date: "2019-06-15", total_value: 181244},
  {date: "2019-06-15", total_value: 47920},
  {date: "2019-06-15", total_value: 12500},
  {date: "2019-06-24", total_value: 36600},
  {date: "2019-06-30", total_value: 427459},
  {date: "2019-06-29", total_value: 267700},
  {date: "2019-07-06", total_value: 10000},
  {date: "2019-07-14", total_value: 80736}
])
ExpendituresFeedstock.create!([
  {expenditure_id: 1, feedstock_id: 1, ammount: 8, price: 47200},
  {expenditure_id: 1, feedstock_id: 2, ammount: 4, price: 21600},
  {expenditure_id: 2, feedstock_id: 3, ammount: 4, price: 181244},
  {expenditure_id: 3, feedstock_id: 4, ammount: 8, price: 47920},
  {expenditure_id: 4, feedstock_id: 5, ammount: 12500, price: 12500},
  {expenditure_id: 5, feedstock_id: 6, ammount: 6, price: 36600},
  {expenditure_id: 8, feedstock_id: 11, ammount: 300000, price: 300000},
  {expenditure_id: 8, feedstock_id: 10, ammount: 127459, price: 127459},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: 6, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: nil, feedstock_id: 9, ammount: 1, price: 55000},
  {expenditure_id: nil, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: 6, feedstock_id: 8, ammount: 1, price: 126400},
  {expenditure_id: 6, feedstock_id: 7, ammount: 1, price: 86300},
  {expenditure_id: nil, feedstock_id: 4, ammount: 10, price: 59900},
  {expenditure_id: 9, feedstock_id: 13, ammount: 4, price: 26236},
  {expenditure_id: 9, feedstock_id: 12, ammount: 3, price: 49500},
  {expenditure_id: 10, feedstock_id: 5, ammount: 4000, price: 4000},
  {expenditure_id: 10, feedstock_id: 14, ammount: 1, price: 6000},
  {expenditure_id: 9, feedstock_id: 5, ammount: 5000, price: 5000}
])
Feedstock.create!([
  {name: "Queso crema colanta", unit: "400g", price: 5900, provider: "Mervelez"},
  {name: "Queso crema alpina", unit: "380", price: 5400, provider: "Mervelez"},
  {name: "Queso crema colanta", unit: "4Kg", price: 45311, provider: "La Abundancia"},
  {name: "Crema de avellanas", unit: "350g", price: 5990, provider: "D1"},
  {name: "Fruta", unit: "0", price: 1, provider: "Luz Marina"},
  {name: "Galletas Ducales", unit: "484g", price: 6100, provider: "Autoservicio Moravia"},
  {name: "Lecherita Vacanisima", unit: "20Kg", price: 86300, provider: "Salsamentaria la 80"},
  {name: "Copas venecianas", unit: "600 unidades", price: 126400, provider: "Salsamentaria la 80"},
  {name: "Cerezas en almíbar", unit: "4Kg", price: 55000, provider: "Salsamentaria la 80"},
  {name: "Servicios", unit: "ND", price: 1, provider: "Une"},
  {name: "Inversión", unit: "ND", price: 1, provider: "Flamingo"},
  {name: "Galletas Ducales 12*9 tacos", unit: "1.456Kg", price: 16500, provider: "Autoservicio Moravia"},
  {name: "Galletas de milo", unit: "72Unidades", price: 6559, provider: "Autoservicio Moravia"},
  {name: "Nevera de icopor", unit: "1Unidad", price: 6000, provider: "Luz Marina"}
])
Payment.create!([
  {date: "2019-05-12", vendor_id: 1, value: 21000},
  {date: "2019-05-19", vendor_id: 1, value: 198000},
  {date: "2019-05-17", vendor_id: 1, value: 100000},
  {date: "2019-05-20", vendor_id: 1, value: 200000},
  {date: "2019-05-27", vendor_id: 1, value: 100000},
  {date: "2019-05-30", vendor_id: 1, value: 172000},
  {date: "2019-05-31", vendor_id: 1, value: 100000},
  {date: "2019-06-01", vendor_id: 1, value: 4000},
  {date: "2019-06-05", vendor_id: 1, value: 200000},
  {date: "2019-06-06", vendor_id: 1, value: 100000},
  {date: "2019-06-08", vendor_id: 1, value: 100000},
  {date: "2019-06-10", vendor_id: 1, value: 101000},
  {date: "2019-06-11", vendor_id: 1, value: 100000},
  {date: "2019-06-18", vendor_id: 1, value: 100000},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-18", vendor_id: 2, value: 12345},
  {date: "2019-06-19", vendor_id: 2, value: 0},
  {date: "2019-06-19", vendor_id: 2, value: 9876},
  {date: "2019-06-19", vendor_id: 2, value: 5432},
  {date: "2019-06-19", vendor_id: 2, value: 5432},
  {date: "2019-06-19", vendor_id: 2, value: 258},
  {date: "2019-06-19", vendor_id: 2, value: 258},
  {date: "2019-06-19", vendor_id: 2, value: 3000},
  {date: "2019-06-19", vendor_id: 1, value: 45000},
  {date: "2019-06-20", vendor_id: 1, value: 100000},
  {date: "2019-06-23", vendor_id: 1, value: 145000},
  {date: "2019-06-24", vendor_id: 1, value: 100000},
  {date: "2019-06-25", vendor_id: 2, value: 12},
  {date: "2019-06-19", vendor_id: 2, value: 1234},
  {date: "2019-06-30", vendor_id: 1, value: 200000},
  {date: "2019-07-01", vendor_id: 1, value: 100000},
  {date: "2019-07-02", vendor_id: 1, value: 100000},
  {date: "2019-07-03", vendor_id: 1, value: 100000},
  {date: "2019-07-08", vendor_id: 1, value: 100000},
  {date: "2019-07-10", vendor_id: 1, value: 100000},
  {date: "2019-07-11", vendor_id: 1, value: 155000},
  {date: "2019-07-13", vendor_id: 1, value: 100000},
  {date: "2019-06-14", vendor_id: 1, value: 72000},
  {date: "2019-06-15", vendor_id: 1, value: 212500},
  {date: "2019-07-05", vendor_id: 1, value: 72000},
  {date: "2019-07-15", vendor_id: 1, value: 100000},
  {date: "2019-07-09", vendor_id: 1, value: 5000},
  {date: "2019-07-06", vendor_id: 1, value: 115000},
  {date: "2019-07-14", vendor_id: 1, value: 5000}
])
Product.create!([
  {name: "Cheesecake", description: "Postre a base de queso crema y lecherita.", price: 3000}
])
Sale.create!([
  {date: "2019-05-02", product_id: 1, ammount: 2, discount: 0.0, vendor_id: 1, total_value: 6000, vendors_profit: 0},
  {date: "2019-05-01", product_id: 1, ammount: 5, discount: 0.0, vendor_id: 1, total_value: 15000, vendors_profit: 0},
  {date: "2019-05-09", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-05-10", product_id: 1, ammount: 6, discount: 0.0, vendor_id: 1, total_value: 18000, vendors_profit: 0},
  {date: "2019-05-11", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-05-14", product_id: 1, ammount: 32, discount: 0.0, vendor_id: 1, total_value: 96000, vendors_profit: 0},
  {date: "2019-05-16", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-05-17", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-05-18", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-05-19", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-05-21", product_id: 1, ammount: 34, discount: 0.0, vendor_id: 1, total_value: 102000, vendors_profit: 0},
  {date: "2019-05-23", product_id: 1, ammount: 34, discount: 0.0, vendor_id: 1, total_value: 102000, vendors_profit: 0},
  {date: "2019-05-25", product_id: 1, ammount: 34, discount: 0.0, vendor_id: 1, total_value: 102000, vendors_profit: 0},
  {date: "2019-05-27", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-05-28", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-05-30", product_id: 1, ammount: 29, discount: 0.0, vendor_id: 1, total_value: 87000, vendors_profit: 0},
  {date: "2019-05-31", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-01", product_id: 1, ammount: 42, discount: 0.0, vendor_id: 1, total_value: 126000, vendors_profit: 0},
  {date: "2019-06-02", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-04", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-06", product_id: 1, ammount: 52, discount: 0.0, vendor_id: 1, total_value: 156000, vendors_profit: 0},
  {date: "2019-06-08", product_id: 1, ammount: 33, discount: 0.0, vendor_id: 1, total_value: 99000, vendors_profit: 0},
  {date: "2019-06-10", product_id: 1, ammount: 33, discount: 0.0, vendor_id: 1, total_value: 99000, vendors_profit: 0},
  {date: "2019-06-11", product_id: 1, ammount: 33, discount: 0.0, vendor_id: 1, total_value: 99000, vendors_profit: 0},
  {date: "2019-06-13", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-06-12", product_id: 1, ammount: 10, discount: 0.0, vendor_id: 1, total_value: 30000, vendors_profit: 0},
  {date: "2019-06-18", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-17", product_id: 1, ammount: 33, discount: 0.0, vendor_id: 1, total_value: 99000, vendors_profit: 0},
  {date: "2019-06-16", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-15", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-22", product_id: 1, ammount: 90, discount: 0.0, vendor_id: 2, total_value: 270000, vendors_profit: 0},
  {date: "2019-06-22", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-25", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-06-26", product_id: 1, ammount: 20, discount: 0.0, vendor_id: 2, total_value: 60000, vendors_profit: 0},
  {date: "2019-06-27", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-27", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 2, total_value: 90000, vendors_profit: 0},
  {date: "2019-06-29", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-06-30", product_id: 1, ammount: 34, discount: 0.0, vendor_id: 1, total_value: 102000, vendors_profit: 0},
  {date: "2019-07-01", product_id: 1, ammount: 50, discount: 0.0, vendor_id: 1, total_value: 150000, vendors_profit: 0},
  {date: "2019-07-02", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-07-04", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-07-06", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-07-08", product_id: 1, ammount: 30, discount: 0.0, vendor_id: 1, total_value: 90000, vendors_profit: 0},
  {date: "2019-07-09", product_id: 1, ammount: 31, discount: 0.0, vendor_id: 1, total_value: 93000, vendors_profit: 0},
  {date: "2019-07-10", product_id: 1, ammount: 10, discount: 0.0, vendor_id: 1, total_value: 30000, vendors_profit: 0},
  {date: "2019-07-11", product_id: 1, ammount: 34, discount: 0.0, vendor_id: 1, total_value: 102000, vendors_profit: 0},
  {date: "2019-07-13", product_id: 1, ammount: 33, discount: 0.0, vendor_id: 1, total_value: 99000, vendors_profit: 0}
])
Vendor.create!([
  {name: "Luz Marina", profit: 0, debt: 383500},
  {name: "Edison Zapata", profit: 0, debt: 410428}
])
