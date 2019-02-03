
best method to add workers to gunicorn?

So I have seen yet so far 3 ways to add workers to gunicorn.

Through flags on command, through systemd .service and through a configuration .py file passed to gunicorn command

I am overhelmed and was wondering which is the best way to set the gunicorn number of workers







seems like daemon is run from within its passed properties, make sure it has that

link the recommended formula of workers 2n+1 from the documentation and the command used to calculate these cores from within

write the final config I will be using here
