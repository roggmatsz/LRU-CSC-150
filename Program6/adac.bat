:start
gcc -c %1 
gnatbind %1
gnatlink %1
gnatmake %1