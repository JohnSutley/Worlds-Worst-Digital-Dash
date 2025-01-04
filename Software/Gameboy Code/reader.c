#include <gb/gb.h>
#include <gbdk/console.h>
#include <stdint.h>
#include <stdio.h>

#define XPOS 6
#define YPOS 8


void main()
{
    uint8_t SW;
    uint8_t change;
    char *p = (char *)0x7fff;
    SW = (p[0]);
    gotoxy(XPOS,YPOS);
    printf("MPH: %u", SW);
    while(1)
    {   
        SW = (p[0]);
        if (SW != change)
        {
        gotoxy(XPOS,YPOS);
        printf("MPH:    ");
        gotoxy(XPOS,YPOS);
        printf("MPH: %u", SW);
        change = SW;
        }
    }
}