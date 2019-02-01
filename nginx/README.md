the trick to nginx configuration is to put it in another folder and then make a symbolic link from "sites-available" to "sites-enabled"

remember since gunicorn doesnt serve static we will be serving it with nginx
