express = require 'express'
stylus = require 'stylus'
nib = require 'nib'
morgan = require 'morgan'

#init app
app = express()

app.set 'port', process.env.PORT||8000
app.set 'views', "./views"
app.set 'view engine', "jade"

app.use morgan 'dev'
app.use express.static "./public"


##API
app.get '/', (req, res)->
    res.render 'index'

    ##handles 404 pages. make sure its the last one
app.get '*', (req, res)->
    res.render '404'

app.listen app.get('port'), ->
    console.log "PCA started on port: #{app.get 'port'}"
