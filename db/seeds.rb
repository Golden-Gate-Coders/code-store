Product.create!([
  {name: "Lightsaber", description: "A bright lightsaber to cut through anything and everything.", price: "1000.0", stock: 3, supplier_id: 1, image: "https://upload.wikimedia.org/wikipedia/commons/1/14/Lightsaber%2C_silver_hilt%2C_blue_blade.png"},
  {name: "HTML Templates", description: "Who has time to write HTML?", price: "30.0", stock: 5, supplier_id: 2, image: "https://www.w3.org/html/logo/downloads/HTML5_Badge_512.png"},
  {name: "Ruby Methods", description: "Some ruby methods to help you out in your journey through ruby.", price: "100.0", stock: 50, supplier_id: 2, image: "https://tctechcrunch2011.files.wordpress.com/2015/04/codecode.jpg?w=738"},
  {name: "Gems", description: "Some sweet, sweet gems.", price: "150.0", stock: 10, supplier_id: 2, image: "http://downloadicons.net/sites/default/files/ruby-icon-6555.png"},
  {name: "Red Bull", description: "To fuel you by night.", price: "5.0", stock: 100, supplier_id: 2, image: "https://images-na.ssl-images-amazon.com/images/I/71r5AAJAtCL._SL1500_.jpg"},
  {name: "Coffee", description: "To fuel you by day.", price: "3.0", stock: 100, supplier_id: 2, image: "http://media.nj.com/entertainment_impact_dining/photo/coffee-stock-photo-0e8b300f42157b6f.jpg"},
  {name: "Syntax Errors", description: "For that time when your code is so flawless you need to buy some errors.", price: "1.0", stock: 9999, supplier_id: 2, image: "https://thumbs.dreamstime.com/x/binary-code-error-11333859.jpg"}
])
Supplier.create!([
  {name: "Jedi Supplies", email: "jedis@jedi.com", phone: "9998887777"},
  {name: "Codemonkey Suppliers", email: "codemonkeys@actualize.co", phone: "0101010101"}
])
User.create!([
  {name: "Danish", email: "danish@test.com", password_digest: "$2a$10$bGINYTS5tF7KrgKItacsluLamDDFyik/sWAYAlh/7AveqRvuosCMa"}
])
