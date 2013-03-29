#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/extensions/scrnsaver.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
/* Report amount of X server idle time. */
/* Build with- */
/* cc xidle.c -o xidle -lX11 -lXext -lXss */

int seconds;

int _time() {
Display *display;
int event_base, error_base;
XScreenSaverInfo info;


display = XOpenDisplay("");

if (XScreenSaverQueryExtension(display, &event_base, &error_base)) {
XScreenSaverQueryInfo(display, DefaultRootWindow(display), &info);

seconds = info.idle/1000;
XCloseDisplay(display);
//printf("%d",seconds);
return 0;
}
else {
fprintf(stderr,"Error: XScreenSaver Extension not present\n");
return(1);
}
}
int main(int argc, char *argv[])
{
//_time();
//printf("\n%d",seconds);
pid_t pid = 0;
pid_t sid = 0;
pid = fork();

if(pid < 0)
{
printf("Fail to start daemon");
exit(1);
}
if (pid > 0) { printf("kill parent process"); exit(0);}

umask(022);
sid = setsid();
if(sid < 0)
{
printf("cannot start session id");
exit(1);
}

while (1){
_time();
//sleep(1);
//seconds = *_time;
printf("%d\n",seconds);
if (seconds == 300)
{
 system("enlightenment_remote -desktop-lock");
 system("xset dpms force off");
}
sleep(1);
}
return 0;
}
