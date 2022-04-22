var express = require('express');
var sql= require('mysql');
var app = express();
var parseUrl = require('body-parser');

let encodeUrl= parseUrl.urlencoded({ extended: false })

const PORT = process.env.PORT || 3001;

let sequelize;

let username;
let pass;
const locations= [];
const inv= [];

let cust;
let a;
let b;
let c;

var con = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "Delete007",
  database: "inventory"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

con.query("SELECT * FROM locations",function(err,result){
								if(err) throw err;
								if(result.length===0){
									
								}
								else{
									Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  locations.push(row);
						});
								}
							}
								);
con.query("SELECT * FROM canopy",function(err,result){
								if(err) throw err;
								if(result.length===0){
									
								}
								else{
									Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  inv.push(row);
						});
								}
							}
								);

con.query("SELECT * FROM chairs",function(err,result){
								if(err) throw err;
								if(result.length===0){
									
								}
								else{
									Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  inv.push(row);
						});
								}
							}
								);
								
con.query("SELECT * FROM tables",function(err,result){
								if(err) throw err;
								if(result.length===0){
									
								}
								else{
									Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  inv.push(row);
						});
								}
							}
								);

app.set('view engine', 'ejs');


app.get('/', function (req, res) {
  res.sendFile('login.html', { root: '.'});
});

app.post('/', encodeUrl, (req, res)=> {
  console.log(req.body);
  const info= [];
  con.query("SELECT * FROM registration WHERE userId= " +  req.body.userId, function(err, result){
	  if(err) throw err;
	  if (result.length===0){
	  res.send("Invalid username");
	  res.end();
	  }
	  else{
		 con.query("SELECT * FROM registration WHERE userId= " + req.body.userId + " and password= '" +  req.body.passw + "'", function(err, result){
	  if(err) throw err;
	   if (result.length===0){
	  res.send("Invalid Password");
	  res.end();
	  }
	  else{
		username= req.body.userId;
		pass= req.body.passw;
		con.query("SELECT * FROM registration,staff WHERE registration.userId = staff.userId AND staff.UserId= "
			+ username, function(err, result){
				 if(err) throw err;
				 if(result.length===0){
					 con.query("SELECT * FROM registration,customers WHERE registration.userId = customers.userId AND customers.userId= "
				 + username, function(err, result){
					 if(err) throw err;
					 if(result.length===0){
						 res.send("User removed by adminstrator, please contact Celebrating Milestones Helpdesk.");
						 res.end();
					 }
					 else{
						   Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  info.push(row);
						});
						 console.log("load customer page");
						 res.render('Customer', {user: info[0],locations: locations});
					 }
				 });
				 }
				 else{
					 console.log("load next page");
					  Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  info.push(row);
						});
						if(info[0].roleId=== 1){
							res.render('Admin', { user: info[0], locations: locations });
						}
						else{
							con.query("select DISTINCT locations.locationId, locationName, city, state from staff, locations "
+"where locations.locationId= staff.locationId "
+ "and staff.locationId= " + info[0].locationId, function(err, result){
			if(err) throw err;
			 Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  res.render('Staff', { user: info[0], location: row });
			 });
			
			}
			);
							
						}
					
				 }
			});
		
	  }
		 });
	  }
  });
});
app.post('/save', encodeUrl, (req, res)=>{
	console.log(req.body);
	con.query("INSERT INTO registration VALUES("
	+ req.body.userId + ",'" + req.body.password
	+"')",function(err,result){
		if(err) throw err;
	}
	);
	con.query("INSERT INTO customers VALUES("
	+ req.body.customerId + ",'" + req.body.fname + "','" + req.body.lname
	+"'," + req.body.userId+ ")",function(err,result){
								if(err) throw err;
								
								res.send("Account added Successfully, You've been assigned the ID: " + req.body.userId
								+ "<br>Please record this for your records.");
	}
	);
}
);

app.post('/signup', encodeUrl, (req, res)=>{
	con.query("SELECT customers.customerId, registration.userId " 
	+"FROM customers, registration WHERE customers.userId= registration.userId "+
	"order by registration.userId desc limit 1",function(err,result){
								if(err) throw err;
								if(result.length===0){
									
								}
								else{
									Object.keys(result).forEach(function(key) {
						  var row = result[key];
						 console.log(row.customerId+1);
						 res.render('Form', { customerId: row.customerId+1, userId: row.userId+1 });
						});
								}
							}
								);
});

app.post('/manage', encodeUrl, (req, res)=> {
	const chairs= [];
const tables= [];
const canopy= [];
const loc= {id: req.body.id};
	con.query("select DISTINCT * from inventory, locations, invchairs, chairs, stock "+
	"where inventory.locationId= locations.locationId AND invchairs.inventoryId= inventory.inventoryId" + 
	" AND chairs.chairId= invchairs.chairId AND stock.stockId= invchairs.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  chairs.push(row);
						});
					
con.query("select DISTINCT * from inventory, locations, invtbl, tables, stock "+
	"where inventory.locationId= locations.locationId AND invtbl.inventoryId= inventory.inventoryId" + 
	" AND tables.tableId= invtbl.tableId AND stock.stockId= invtbl.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  tables.push(row);
						});
	b= tables;		

con.query("select DISTINCT * from inventory, locations, invcanopy, canopy, stock "+
	"where inventory.locationId= locations.locationId AND invcanopy.inventoryId= inventory.inventoryId" + 
	" AND canopy.canopyId= invcanopy.canopyId AND stock.stockId= invcanopy.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  canopy.push(row);
					
						});
						if(canopy.length===0 && tables.length===0 && chairs.length===0){
							res.render('Manage', {loc: loc, canopy: canopy, tables: tables, chairs: chairs});
							res.end();
						}
						else{
							res.render('Manage', {loc: loc, canopy: canopy, tables: tables, chairs: chairs});
							res.end();
						}
						
						
}
);	
}
);						
}

);

	
});

app.post('/view', encodeUrl, (req, res)=> {
const chairs= [];
const tables= [];
const canopy= [];
	con.query("select DISTINCT * from inventory, locations, invchairs, chairs, stock "+
	"where inventory.locationId= locations.locationId AND invchairs.inventoryId= inventory.inventoryId" + 
	" AND chairs.chairId= invchairs.chairId AND stock.stockId= invchairs.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  chairs.push(row);
						});
					
con.query("select DISTINCT * from inventory, locations, invtbl, tables, stock "+
	"where inventory.locationId= locations.locationId AND invtbl.inventoryId= inventory.inventoryId" + 
	" AND tables.tableId= invtbl.tableId AND stock.stockId= invtbl.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  tables.push(row);
						});
	b= tables;		

con.query("select DISTINCT * from inventory, locations, invcanopy, canopy, stock "+
	"where inventory.locationId= locations.locationId AND invcanopy.inventoryId= inventory.inventoryId" + 
	" AND canopy.canopyId= invcanopy.canopyId AND stock.stockId= invcanopy.stockId AND inventory.locationId= " 
	+ req.body.id, function(err,result){
	Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  canopy.push(row);
					
						});
						if(canopy.length===0 && tables.length===0 && chairs.length===0){
							res.send("Location is currently unstocked.");
							res.end();
						}
						else{
							res.render('Inventory', {canopy: canopy, tables: tables, chairs: chairs});
							res.end();
						}
						
						
}
);	
}
);						
}
);
});


app.post('/order', encodeUrl, (req, res)=> {
	const orders= [];
	console.log(req.body);
	con.query("select * from orders, locations, customers where customers.customerId= orders.customerId and"
 +" locations.locationId= orders.locationId and locations.locationId= " + req.body.id + " and customers.customerId= " + req.body.customer,function(err,result){
		console.log(result);
		Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  orders.push(row);
						});
						if(orders.length=== 0){
							res.send("No orders found for this location.");
							res.end();
						}
						else{
							res.render('Orders', {orders: orders});
						}
	}
	
);
	
});


app.post('/orders', encodeUrl, (req, res)=> {
	const orders= [];

	console.log(req.body.id);
	con.query("select * from orders, locations, customers where customers.customerId= orders.customerId and"
 +" locations.locationId= orders.locationId and locations.locationId= " + req.body.id,function(err,result){
		console.log(result);
		Object.keys(result).forEach(function(key) {
						  var row = result[key];
						  orders.push(row);
						});
						if(orders.length=== 0){
							res.send("No orders found for this location.");
							res.end();
						}
						else{
							res.render('Orders', {orders: orders});
						}
	}
	
);
	
});

app.post('/add', encodeUrl, (req, res)=> {
	res.render('Add', {inv:inv});
	
	
});

app.post('/edit', encodeUrl, (req, res)=> {
	console.log(req.body);
	
});


app.listen(PORT, function () {
  console.log('Listening');
});