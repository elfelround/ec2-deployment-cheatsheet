https://jee-appy.blogspot.com/2017/01/deply-django-with-nginx.html

as you can see from this bash script, the gunicorn parameters here are passed with flags --flag when calling the command, here the person decided to write all the commands on a bash file instead of having to type it all the time

sudo chmod u+x gunicorn_start.bash       //remember to make it executable 

./gunicorn_start.bash           //this to run it

********************************************delete above stuff*************************************
#!/bin/bash

NAME="django_app"                                   # Name of the application
DJANGODIR=/home/ubuntu/sample_project               # Django project directory
SOCKFILE=/home/ubuntu/django_env/run/gunicorn.sock  # we will communicte using this unix socket
USER=ubuntu                                         # the user to run as
GROUP=ubuntu                                        # the group to run as
NUM_WORKERS=3                                       # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=sample_project.settings      # which settings file should Django use
DJANGO_WSGI_MODULE=sample_project.wsgi              # WSGI module name
echo "Starting $NAME as `whoami`"

# Activate the virtual environment

cd $DJANGODIR
source /home/ubuntu/django_env/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist

RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=-
