CC=gcc
CINCS  = -I/opt/local/include
#CFLAGS= -Wall -x objective-c++ -framework Cocoa,AppKit
CFLAGS= -Wall -framework Cocoa,CoreServices

all: dict

dict: main.m
	$(CC) $(CFLAGS) -o $@ $<

dict32: main.m
	$(CC) $(CFLAGS) -arch i386 -o $@ $<
