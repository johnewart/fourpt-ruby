#!/usr/bin/env ruby
require 'rubygems'
require '../lib/fourpt'

include FourPoint

c = Channel.new()
c.number = 1
c.length = 12800
c.resistance = 0.026
c.dx = 1280 # ten computational cross-sections

upstream = CrossSection.new()
upstream.width = 100
upstream.elevation = -5.0
upstream.discharge = 1.0
upstream.water_elevation = 2.2

downstream = CrossSection.new()
downstream.width = 800
downstream.elevation = -5.0
downstream.discharge = 1.0
downstream.water_elevation = 2.2

c.cross_sections << upstream 
c.cross_sections << downstream

m = Model.new("single_channel")
m.channels << c
m.icndap = 7
m.maxtimesteps = 80
m.time_step = 300
m.time_weight = 0.6
m.export()


=begin
.GEO

0                  / output index ( 0 - no echo, 1 - echo ).

1                  / channel number.
0.026              / flow resistance coefficient.
Upstream_1         / upstream cx ID.
0.0 100.0 -5.0     / downstream ref. distance, width, btmelev.
Downstream_1       / downstream cx ID.
12800.0 800.0 -5.0 / downstream ref. distance, width, btmelev.


.SCH
     1                   / branch number
        2, 1280.0, 1, 7, 0 / no. of cx, dx, NKEEP, ICNDAP, NVAL
Upstream_1               / cx ID
          2.2, 1.0       / WS, Q
Downstream_1             / cx ID
          2.2, 1.0       / WS, Q

 2                       /condition code     upstream
  0                      /connections

 1                       /condition code     downstream
  0                      /connections
=end
