// routes/addEmployee.js

var express = require('express');
var router = express.Router();
var DataBaseHandler = require("../config/DataBaseHandler");
var dataBaseHandler = new DataBaseHandler();

var connection = dataBaseHandler.createConnection();

router.get('/', function(req, res, next) {
    res.render('addEmployee', { title: 'Add Employee' });
});

router.post('/add', function(req, res, next) {
    // Handle form submission and insert data into MySQL
    var formData = req.body; // Assuming you have a form with appropriate fields

    // Perform MySQL INSERT query using the form data
    var query = 'INSERT INTO EMPLOYEE (FirstName, LastName, Phone, Address, City, FullName, Email, Pin, CreationDate, EmployeeCode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    var values = [
        formData.FirstName,
        formData.LastName,
        formData.Phone,
        formData.Address,
        formData.City,
        formData.FullName, // Assuming you have a FullName field in your form
        formData.Email,
        formData.Pin,
        formData.CreationDate, // Assuming you have a CreationDate field in your form
        formData.EmployeeCode
    ];

    connection.query(query, values, function(error, result, fields) {
        if (error) {
            console.error("Error inserting data into the database:", error);
            res.status(500).send({
                status: "ERROR",
                message: "Failed to insert data into the database."
            });
        } else {
            res.redirect('/employee'); // Redirect to the employee page after successful insertion
        }
    });
});

module.exports = router;
