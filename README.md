# Boris Bikes Project
----------

```
            /'=----=          ______
           ((    ||          "--.__."
            "  @>||_____________//
         _______ /^\"""""""""""//\========)
        _--"""--/-. "\        // _\-:::-/_-.
      ." .-"""-/ "_\  "\  == // ;  \   /  ".\
     ; /     _/ "  \\   "\-+//--..__\_/     \\
     . ;    o    . ||   ( ()/)======(o)     :.
     . \         ; .|    -|.;____...."b    :;
      . -._  _ -  ;       ==    ::        :;
       "-..____.'                 "::::::"
```

### Overview

London's Boris Bikes (well, 'Santander Cycles') are awesome. Anyone can hire out a bike and ride it around London. This 'Boris-Bikes' reposistory is a Makers Academy pair-programming project to create a Ruby program which emulates the basic functions of the real like Boris Bikes system.

### How to Install & Example

The application is written in Ruby and run directly from the command line, so to install simply clone or fork the repository, change directory to the root folder, open irb, and paste the following code:
```
require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/van.rb'
require './lib/garage.rb'
```
Alternatively, run *rspec* to see the test documentation or the example script from the example folder to see a brief overview of the program functionality.

### Customer Requirements

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.
```
```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```
```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```
```
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```
```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
--------
### Extract Scope
*Docking Station*
- Allows bikes to be docked with option of reporting them as faulty
- Bikes can be released from the docking station bike rack when available
- Broken bikes will not be released
- Bike rack has capacity which can be set by user upon initialization
- Broken bikes can be picked up from docking station
- Fixed bikes can be dropped at docking station

**Bike**
- Working object attribute
- Ability to change working attribute

**Van**
- Ability to collect bikes from location
- Ability to drop bikes at location while specifying whether to drop broken or fixed bikes

**Garage**
- Bikes can be dropped at garage
- Bikes at garage can be fixed
- Fixed bikes can be picked up from garage
--------

### Approach

* Followed Makers Academy challenge readme with various pairs in cohort.
* Refactored, cleanup, extended readme, added example file.
