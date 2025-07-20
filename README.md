# Deliver Markdown in a Web Browser

## Overview

I wanted a way to deliver markdown files over a web server without having to convert them manually to HTML.  This is the result of that.  This project delivers the following features:

 1. Renders Markdown files using in web browser (think how Gitgub renders the README.md file).
 2. Allows Mermaid diagrams to be displayed.
 3. Allow GFM style alerts to be displayed. 
 4. Uses Gitlab style CSS for rendering to make it appealing on the eye.

## Installation

### Manual Installation

The files presented are used with NGINX.  I have not made an Apache equivalent server definition.

 1.  Copy the contents of the HTML folder to desired location `/var/www/markdown`
 2. Copy the `markdown-server.conf` from the NGINX folder into `/etc/nginx/conf.d/sites-available` and symlink to `sites-enabled` in the same folder (or just copy to the `sites-enabled` folder)
 3. Modify `markdown-server.conf` to suit your needs (add SSL, authentication etc).

Test to make sure it is working by browsing to the server_name defined in the configuration file.  You should get the default Markdown page.

4. Replace the content in the `markdown` folder with your own content.

### Docker

To run the container and get the default Markdown file: `docker run --rm -p 80:80 gooseleggs/html-markdown-renderer:1.0`


Bind mount your files to `/var/www/html/markdown`

`docker run --rm -p 80:80 -v ~/markdown:/var/www/html/markdown gooseleggs/html-markdown-renderer:1.0`

### Docker-Compose

An example docker-compose file has been provided that can be tailored to standup the server.

## To Do
As with anything, there is always more that can be done.  This is my current list (in no particular order):

 - Nothing as yet.

## Thanks

I did not write all the code for this.  I used a [gist](https://gist.github.com/max-lt/76de5a9765fa713cc5a6e267914ebba6) as the baseline, then modified the `md-renderer.html` file to meet the needs.

## Uses
This project using Marked for client side rendering, delivered over CDN along with the Mermaid javascript.  The Github CSS is delivered locally.
