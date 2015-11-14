# hacktop
Everything Hacktops

## Welcome to Hacktop
The Hacktop project is basically a reconsolidation of several previous Github projects that I've done in the past only all the content is reigned in to one project.

Most of the information can be found in [this projet's wiki](https://github.com/jrcharney/hacktop/wiki)

In this project we talk about how to build a Raspberry Pi Hacktop which the application can be applied to single board computers (SBCs) like Raspberry Pis and Odroids.  This information is not limited to those kinds of SBCs.

This project is also a call to the folks at Motorola to reintroduce the Atrix Lapdock or for other computer manufactures to produce a lapdock by 2020 if not sooner.

## Why start over?
After my upgrade to the Raspberry Pi 2, I found a need to centralize all my content.  I learned a lot from doing things with my Raspberry Pi B, my Odroid U3, and my Raspberry Pi B+ that I had made a big mess on my GitHub site with all sorts of decommissioned projects.

## Why reintroduce the lapdock?
When the Motorola Atrix and Motorola Droid Bionic came out in 2011, they had an appealing feature: They could be docked into a laptop interface called a lapdock.  Since smartphones are basically small computers, users could plug their phone into this external device to use their phone as the brains behind a netbook.

However, the marketing appeal of the lapdock fell through for several reasons. Many of the apps for Android were more intuitive to touch screen applications of which the lapdock did not have). The original price for one of these peripherals was $500, a cost most customers were not going to spend after upgrading to another phone for about $250.  The lapdock for the Atrix was not compatible with the lapdock for the Bionic and vice versa because the miniHDMI and miniUSB ports were positioned differently, so they couldn't be used with one another not even with adapter cables despite both phones practically having the same computing power. And since electronics manufacturers--including Motorola--were transitioning to the terrible model of short-lifespan planned obsolecense, the next set of phones they released did not come with a mini HDMI port anymore, which made the lapdock just another fad...or so Motorola thought.

Out of the ashes of this failed experiment rose a new potential among computer enthusiasts.  With the rise of SBCs, some Raspberry Pi users (including myself) didn't want to be tethered to an old TV screen, a mouse, a keyboard, and and Ethernet port especially since SBCs are more useful than just cheap computers but cheap computers that can be designed to do specific things out in the open and in the real world.

They saw tablet computers to be a fad.  Great in concept with the fact that you could touch the screen, which is almost becoming a standard or must have feature for any portable computer, but it lacked the necessary things that some users still wanted, like being able to use a physical keyboard or use a touchpad or plug in a mouse to scroll through pages.  While the lapdock doesn't specifically offer that last part (unless someone knows how to write a program to make it do so for that specific part of the touch pad) and the Motorola lapdocks do not have a touch screen (which as I pointed out was one of its many faults especially since it was working with Android), it does offer a means to allowe consumers the freedom to use their products whereever.  It's a company principal that after a few mergers and aquistions between Google and Lenovo (which that last one was a bad idea consider every time Lenovo comes out with a new Thinkpad, it's loaded with Chinese spyware) and a split into two companies (whatever the heck that meant), the lapdock is a way for Motorola to find itself again through that spirit they promoted from the first car radio they produced to the popularization of cellular telephones, to the rise of the Razr and the Droid: FREEDOM!

At one point even Motorola knew what it was doing noting how it's logo looked like a set of wings.  Wings that projects like this one can gain from turning a now $60 peripheral that was once $500 and a $35 SBC and a $20 microSD card along with a few wires, some industrial velcro tape, and a WiFi dongle can, can work on their Raspberry Pi from wherever as long as the power doesn't run out on the battery.

Hacktoping has the advantage of making it easy to upgrade hardware.  If you don't like what you've done with what's on the microSD card, format it and mount a new image to start over or return to a previous backed up image.  If a new Raspberry Pi comes along, swap the chip out, follow these instructions.  It would be nice if the contents on the storage device were backwards compatible that I wouldn't need to recompile or install everything. (If this is possible, let me know.)

## Why Raspberry Pi?
As much as everyone had appealed to me their own experiences using faster, more expensive SBCs, the Raspberry Pi continues to be the SBC for hacktopping. It's cheap. It's readily available at physical shops (i.e. Micro Center), and the applications are limitedless.  It's basically the [**The Hitchhiker's Guide to the Galaxy**](https://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy) of SBCs.  If it were more H2G2-like, the enclosures would be engraved with the words "Don't Panic" on the top instead of the Raspberry Pi logo.

Even if someone says "{Insert SBC here} can do it better", consider that unless lots of other people where you are have "{Insert SBC here}", unless you really really need it, just stick with what you know.

## What does Hacktop cover?
Hacktop will cover the following topics:
* Hardware assembly (not assembly language mind you, but the gathering of parts for this project)
* Installation. (Just about every site explains this.)
* Software recommendations. (Things that are not covered in a typical software installation.)
* Software defined radio. (Something I'm interested in that I'm sure the Raspberry Pi 2 FINALLY supports.)
* Electronics tinkering.  (I'll probably do this with my two older Pis first.)
* 3D Printing. (Not sure if the Pi is ready for this application yet.  It probably is.)

There are certain reservations I have with what is installed on the Pi that continue to press me towards source compilation rather than using the binaries, no matter what most people say.  For instance, Node can now be used on the Rapsberry Pi again thanks in part to the transfer of this project from Joyent to the Linux Foundation.  Secondly, as much as everybody loves python (and who doesn't), if you are familiar with GitHub Pages (which I am slowly transitioning to), you know that it relies on Jekyll, which is a Gem used by Ruby to make websites without the drama that using Ruby on Rails has that requires a ton of understanding about the MVC model of computing.

## Why compile some things instead of using the binaries?
I get told this all the time. "You're better off using the binaries."  It goes along with the same reason we're using Raspberry Pi over some other SBC.  Sure, Raspbian was designed as a Debian flavor of Linux to work for the Raspberry Pi, but have the people who ask this question considered that some of the binaries are still older than the Raspberry Pi project itself.

Generally, the rule should be this: If you really want to do something specific, install the new stuff for it.

The Raspberry Pi for the average user is designed to be a learning computer.  It's affordablity makes it ideal for children to play an older version of Minecraft or use some cookie cutter software programming program for learning.

For the task specific things, or if you are looking for something cheap to hack that won't ruin your nice computer where you do everything else, the Pi is great for trying out new stuff.  Basically, for the kids, it is a playpen. For the adults, it's a proving grounds or a test dummy.

Whatever you plan to use it for, if you plan on using it with a hacktop interface, this is the GitHub to follow.
