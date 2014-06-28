# Gitlab docker start script

These scripts aid in the deployment and administration of Gitlab on
docker in a simple environment. Simply set the relevant bits in
vars.sh to their values or supply them on the command line when
running ./setup.sh to persist them for future use.


## Usage

These scripts are set up in such a way that only two in-band steps are required:

1. Run `./setup.sh` with variables properly set
2. Run `./start.sh` to start the app

Out of band concerns (read: requirements):

- Terminating webserver, perhaps a local nginx instance that will
  proxy requests to the docker container
  
- Database, you will need a database prior to running `setup.sh` as
  that will run migrations on the database.

- Redis, though not required and is not a case `vars.sh` handles,
  there is a chance that in the next few releases redis may leave the
  all-in-one container and need to be run locally (*not* required
  yet).

- SSH binding, when using git@blah.com as remote you are sshing. If
  you would like gitlab to be able to do so, you must either listen on
  a different port for local ssh and allow gitlab to use 22 or vice
  versa and do what you wish.


## Tips

I have none yet, I'm just barely deploying this myself and am
uploading it to have a home. I would advise using this as a silly
reference and moving along.

## License

    The MIT License (MIT)
    
    Copyright (c) 2014 Jacob Vallejo
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

