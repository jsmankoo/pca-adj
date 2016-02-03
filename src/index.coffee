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

app.get '/overview', (req, res)->
    res.render 'overview'

app.get '/team', (req, res)->
    res.render 'team'

app.get '/team/:id', (req, res)->
    id = req.params.id
    res.render 'member', {
        memberID: id
    }

app.get '/david-cernak', (req, res)->
    id = req.params.id
    res.render 'member', {
        memberID: 85
    }


app.get '/jobs', (req, res)->
    res.render 'jobs'

app.get '/jobs/:id', (req, res)->
    id = req.params.id
    res.render 'job', {
        jobID: id
    }

app.get '/services', (req, res)->
    res.render 'services'

app.get '/posts', (req, res)->
    res.render 'posts'

app.get '/posts/:id', (req, res)->
    id = req.params.id
    res.render 'post', {
        postID: id
    }

app.get '/locations', (req, res)->
    res.render 'locations'

app.get '/resources', (req, res)->
    res.render 'resources'

##handles 404 pages. make sure its the last one
app.get '*', (req, res)->
    res.render '404'

app.listen app.get('port'), ->
    console.log "PCA started on port: #{app.get 'port'}"
