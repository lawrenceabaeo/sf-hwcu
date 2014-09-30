# San Francisco Human Waste Cleanup Introductory Website

## URL
[sf-hwcu.herokuapp.com/](http://sf-hwcu.herokuapp.com/)

## About

This infotainment brochure website introduces users to San Francisco’s Human Waste and Urine Cleanup efforts. It was designed as a responsive website, and should be comfortably viewable on both a desktop machine as well as mobile devices. It was produced as an entry for the 2014 ‘[San Francisco Open Data Coding Contest](http://www.programmr.com/hired-coding-contest)’, held by [programmr.com](http://www.programmr.com) and sponsored by [hired.com](http://www.hired.com)

## Data

The contest required use of data from [DataSF](https://data.sfgov.org/). 

For this website, the chunk of 3600+ case data came from an xml download on SF Open Data’s website, located here: 
[https://data.sfgov.org/api/views/mv85-4ee7/rows.xml?accessType=DOWNLOAD](https://data.sfgov.org/api/views/mv85-4ee7/rows.xml?accessType=DOWNLOAD)

Note: DataSF has an existing interactive web application to view a heatmap human waste data, which can be viewed here: 
[https://data.sfgov.org/City-Management-and-Ethics/Human-Waste/mv85-4ee7](https://data.sfgov.org/City-Management-and-Ethics/Human-Waste/mv85-4ee7)

## Technology Highlights

* Ruby on Rails 4x
* nokogiri gem (to process the initial data file)
* [bootstrap-sass gem](https://github.com/twbs/bootstrap-sass)
* [bootswatch lumen theme](http://bootswatch.com/lumen/) 
* [font-awesome-rails gem](https://github.com/bokmann/font-awesome-rails)
* [Google Draw](https://docs.google.com/drawings) and [Microsoft Paint](http://en.wikipedia.org/wiki/Microsoft_Paint) to produce the hazmat man logo
