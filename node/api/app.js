var express = require("express");
var bodyParser = require('body-parser');

var app = express();

// Use body-parser middleware to parse URL-encoded form data
app.use(express.urlencoded({ extended: true }));

app.set("view engine", "jade");

var index = require('./routes/index');
var employee = require('./routes/employee');
var addEmployeeRouter = require('./routes/addEmployee');
var placelocation = require('./routes/placelocation');

app.use(bodyParser.json());
app.use(express.static("public"));
app.use('/employee', employee);
app.use('/', index);
app.use('/placelocation', placelocation);
app.use('/addEmployee', addEmployeeRouter);

app.listen(8123);
