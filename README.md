# RF24Gateway #
The **RF24Gateway** project is a complimentary library to **RF24Ethernet**, for
the _Raspberry Pi_ and _Embedded Linux_ devices.


## Details ##
To understand the purpose of **RF24Gateway**, the purpose of **RF24Ethernet**
must be understood.


### RF24Ethernet ###
**RF24Ethernet** allows a variety of small _Arduino-like_, _AVR_, _ARM_, amongst
other _microcontroller-style devices_, to communicate using traditional methods,
primarily **TCP/IP** over _inexpensive, readily available, 2.4 GHz devices_: the
**NRF24L01** and **NRF24L01+** radio transcievers from _Nordic Semiconductor_.


### RF24Gateway ###
The _**RF24Gateway** library_ allows a variety of _embedded Linux devices_, such
as the famed __Raspberry Pi__ series of devices, to function as a _gateway_ for
the **RF24Ethernet** nodes in the _Mesh Network_, handling typical functions for
a gateway, such as _routing **TCP/IP** packets_, _maintaining "ARP tables"_, and
_tracking connection data_. Meanwhile, users are still able to utilize standard
**RF24Network** (_non-**TCP/IP**_) packets, as well (_see documentation below_).


## Project Layout ##
_As of this point in time_, I believe that the layout of the project is somewhat
disorganized. **As part of my cleanup effort**, I aim to reorganize this (and
the other RF24_xxx_ projects) to meet a more clean, organized, standard, and
concise layout.

For details on the cleanup progress for this specific project, please see the
infomration contained in **CLEANUP.md**. Though there is not yet a location for
plans to cleanup the entire _"suite"_ of RF24_xxx_ libraries, it is currently
being worked on, and should be available soon. The final idea is to be able to
clone/download the _"master"_ project, and build/manage/install any/all of the
individual _sub_-projects from tools located within the _"master"_ project, all
while retaining the _individual_ and _modular_ aspect of each of the available
_sub_-projects.


### Directory Structure ###



## Documentation ##
The documentation below is provided by [_TMRh20_](https://github.com/TMRh20);
in due time, I will generate my own documentation, and update the links below.

- [All Documentation](http://tmrh20.github.io)
- [RF24](http://tmrh20.github.io/RF24)
- [RF24Ethernet](http://tmrh20.github.io/RF24Ethernet)
- [RF24Gateway](http://tmrh20.github.io/RF24Gateway)
- [RF24Mesh](http://tmrh20.github.io/RF24Mesh)
- [RF24Network](http://tmrh20.github.io/RF24Network)