the trick to nginx configuration is to put it in another folder and then make a symbolic link from "sites-available" to "sites-enabled"

remember since gunicorn doesnt serve static we will be serving it with nginx
Putting nginx in the front of your stack not only allows you to route static content requests to your s3 storage but also give you the ability to do things like caching your django requests and lower the hits in your app and database. You can set up fine grain cache policies and have more control of exactly where requests will go, all while still under the same url structure as your set up in django
