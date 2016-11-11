# RF24 Libraries Cleanup Project #
Each component of the _RF24_ set of libraries by _TMRh20_ will have a **CLEANUP.md** file, which shall contain notes
about what has been done to cleanup and/or improve the library.

## RF24Gateway ##
This is specific to the _RF24Gateway_ project.

### TODO ###
- Clean up and format all files
- Re-organize the **examples** directory
- Implement the ability to load a configuration file from **$(PREFIX)/etc/RF24.cfg**


### Thoughts & Ideas ###
- Create a _"helper script"_ to toggle options in **Doxyfile**
  - Use **CLANG\_ASSISTED\_PARSING**
- Re-architect the gateway core to split the frontend and backend into separate components
  - This would allow the gateway backend to run as a system service (ie: via _systemd_)
  - The backend could listen for connections in a variety of _(user-configurable)_ methods:
    - **UNIX socket**
    - **TCP/IP** on _localhost-only_
    - **TCP/IP** on external interfaces, which would allow a frontend to monitor the gateway from another machine
    - _No frontend_, but simply output important messages to stdout (to be captured by **syslog**/**journald**)
    - _No frontend_, but log statistics to a log file, SQLite database, or even a _"big"_ database, such as **PostgreSQL** or **MySQL**
