/*
 * setgetscreenres.m
 * 
 * juanfc 2009-04-13
 * Based on newscreen
 *    Created by Jeffrey Osterman on 10/30/07.
 *    Copyright 2007 Jeffrey Osterman. All rights reserved. 
 *    PROVIDED AS IS AND WITH NO WARRANTIES WHATSOEVER
 *    http://forums.macosxhints.com/showthread.php?t=59575
 *
 * COMPILE:
 *    c++ setgetscreenres.m -framework ApplicationServices -o setgetscreenres
 *    cc setgetscreenres.m -framework ApplicationServices -o setgetscreenres
 * USE:
 *    setgetscreenres 1440 900
 *    setgetscreenres 2880 1800
 */

#include <ApplicationServices/ApplicationServices.h>

int main (int argc, const char * argv[]){
    int h; // horizontal resolution
    int v; // vertical resolution
    CFDictionaryRef mode; // mode to switch to
    CGDirectDisplayID display_id;  // ID of main display
    CFDictionaryRef CGDisplayCurrentMode(CGDirectDisplayID display);
    if (argc == 1) {
        CGRect screenFrame = CGDisplayBounds(kCGDirectMainDisplay);
        CGSize screenSize  = screenFrame.size;
        printf("%d %d\n", (int)screenSize.width, (int)screenSize.height);
        return 0;
    }
    if (argc != 3 || !(h = atoi(argv[1])) || !(v = atoi(argv[2])) ) {
        fprintf(stderr, "ERROR: Use %s horres vertres\n", argv[0]);
        return -1;
    }
    display_id = CGMainDisplayID();
    mode = CGDisplayBestModeForParameters(display_id, 32, h, v, NULL);
    CGDisplayConfigRef config;
    if (CGBeginDisplayConfiguration(&config) != kCGErrorSuccess) {
        fprintf(stderr, "Error");
        return 1;
    }
    CGConfigureDisplayMode(config, display_id, mode);
    CGCompleteDisplayConfiguration(config, kCGConfigureForSession );
    return 0;
}

