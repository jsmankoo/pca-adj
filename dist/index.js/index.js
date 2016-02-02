// Generated by CoffeeScript 1.10.0
(function() {
  var app, express, morgan, nib, stylus;

  express = require('express');

  stylus = require('stylus');

  nib = require('nib');

  morgan = require('morgan');

  app = express();

  app.set('port', process.env.PORT || 8000);

  app.set('views', "./views");

  app.set('view engine', "jade");

  app.use(morgan('dev'));

  app.use(express["static"]("./public"));

  app.get('/', function(req, res) {
    return res.render('index');
  });

  app.get('/overview', function(req, res) {
    return res.render('overview');
  });

  app.get('/team', function(req, res) {
    return res.render('team');
  });

  app.get('/team/:id', function(req, res) {
    var id;
    id = req.params.id;
    return res.render('member', {
      memberID: id
    });
  });

  app.get('/david-cernak', function(req, res) {
    var id;
    id = req.params.id;
    return res.render('member', {
      memberID: 85
    });
  });

  app.get('/jobs', function(req, res) {
    return res.render('jobs');
  });

  app.get('/services', function(req, res) {
    return res.render('services');
  });

  app.get('/posts', function(req, res) {
    return res.render('posts');
  });

  app.get('/posts/:id', function(req, res) {
    var id;
    id = req.params.id;
    return res.render('post', {
      postID: id
    });
  });

  app.get('/locations', function(req, res) {
    return res.render('locations');
  });

  app.get('*', function(req, res) {
    return res.render('404');
  });

  app.listen(app.get('port'), function() {
    return console.log("PCA started on port: " + (app.get('port')));
  });

}).call(this);
