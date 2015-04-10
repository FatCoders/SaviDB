// JavaScript Document
var exec = require('cordova/exec');

var SaviDB = {
	get : function(key, successCallback, errorCallback){
		cordova.exec(successCallback, errorCallback, 'SaviDB', 'get', [key])
	},
	set: function(key, value, successCallback, errorCallback){
		cordova.exec(successCallback, errorCallback, 'SaviDB', 'set', [key, value])
	},
	remove: function(key, successCallback, errorCallback){
		cordova.exec(successCallback, errorCallback, 'SaviDB', 'remove', [key])
	},
	clear: function(successCallback, errorCallback){
		cordova.exec(successCallback, errorCallback, 'SaviDB', 'clear', [])
	}
}

module.exports =  SaviDB;
