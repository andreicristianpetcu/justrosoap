#!/usr/bin/env ruby
# encoding: utf-8

require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
client.operations
response = client.call(:hello_world, message: {})
puts response.body

response = client.call(:cautare_sedinte, message: {institutie: 'CurteadeApelBUCURESTI', dataSedinta: '2013-03-05'})
puts response.body
puts response.body[:cautare_sedinte_response][:cautare_sedinte_result][:sedinta][0][:departament]
