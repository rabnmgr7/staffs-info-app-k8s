/**
 * Created by Carlos Leonardo Camilo Vargas HUuamán on 12/3/16.
 */

var express = require('express');
var router = express.Router();
var DataBaseHandler = require("../config/DataBaseHandler");
var dataBaseHandler = new DataBaseHandler();

var connection = dataBaseHandler.createConnection();

router.get('/', function (req, res, next) {
    connection.query('CALL sp_GetEmployee();', function (error, result, fields) {
        if (error) throw error;

        if(result[0].length== 0){
            res.status(404).send({
                status : "ERROR",
                message: "There is no user in the database."
            });
        } else {
	    res.render('employee', { title: 'Employee Details', data: result[0] });
        }
    });
});

module.exports = router;
