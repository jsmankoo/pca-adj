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

## 301 redirects
app.get '/team.htm', (req, res)->
    res.redirect 301, '/team'

app.get '/bio_ericc.htm', (req, res)->
    res.redirect 301, '/team/169'

app.get '/jobs.htm', (req, res)->
    res.redirect 301, '/jobs'

app.get '/resources.htm', (req, res)->
    res.redirect 301, '/resources'

app.get '/ottawacontact.htm', (req, res)->
    res.redirect 301, '/locations'

app.get '/bio_davidc.htm', (req, res)->
    res.redirect 301, '/david-cernak'

app.get '/bio_jenniferg.htm', (req, res)->
    res.redirect 301, '/team/93'

app.get '/bio_patts.htm', (req, res)->
    res.redirect 301, '/team/91'

app.get '/Bellevillelcontact.htm', (req, res)->
    res.redirect 301, '/locations'

app.get '/bio_tracye.htm', (req, res)->
    res.redirect 301, '/team/166'

app.get '/bio_valc.htm', (req, res)->
    res.redirect 301, '/team'

app.get '/bio_matts.htm', (req, res)->
    res.redirect 301, '/team/161'

app.get '/contactinfo.htm', (req, res)->
    res.redirect 301, '/locations'

app.get '/cornwallcontact.htm', (req, res)->
    res.redirect 301, '/team/locations'

app.get '/aboutus.htm', (req, res)->
    res.redirect 301, '/overview'

app.get '/newsandevents.htm', (req, res)->
    res.redirect 301, '/posts'

app.get '/bio_marionm.htm', (req, res)->
    res.redirect 301, '/team'

app.get '/cornwallhire.htm', (req, res)->
    res.redirect 301, '/jobs'

app.get '/home.htm', (req, res)->
    res.redirect 301, '/'

app.get '/commissioner.htm', (req, res)->
    res.redirect 301, '/david-cernak'

app.get '/bio_andrewl.htm', (req, res)->
    res.redirect 301, '/team'

##handles 404 pages. make sure its the last one
app.get '*', (req, res)->
    res.status 404
    res.render '404'

app.listen app.get('port'), ->
    console.log "PCA started on port: #{app.get 'port'}"
