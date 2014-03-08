# Atom.io http-post Package

A simple Atom.io http-post to test RESTful API.

This is a Work-In-Process

# Install:
```
apm install http-post
```

# Usage:
http-post uses a JSON module to execute the request on the specified hostname.  Open Atom.io and create a new file with the below format.  In Atom, press "command+shift+P" then type "Http Post: Request" or "Control+Option+P" to execute the package.

# Example JSON module:
```
  module.export = {
    hostname: [Host IP or DNS],
    path: [Path for Resrouce],
    method: [GET | POST]
    body: { - Optional - }
  }
```
