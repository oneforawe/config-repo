# How-To: Windows 10 Reverse Mouse Scroll Direction

## Source

<https://www.windowscentral.com/how-reverse-scrolling-direction-windows-10>

## Article

### How to reverse mouse and touchpad scrolling direction on Windows 10

By Mauro Huculak published January 12, 2022

#### Intro

Yes, you can reverse the mouse or touchpad scrolling direction, and here's how
on Windows 10.

On Windows 10, the mouse and touchpad are ubiquitous input peripherals that make
navigation and interaction with elements on the desktop a lot easier. However,
there's a problem. These peripherals have a default scroll direction (scroll
down to move up), which, while it works for the majority of users, it's not the
default behavior everyone feels comfortable using.

If you are among those who like pages to move up as you scroll up for a more
natural experience, Windows 10 includes an option to reverse the scrolling
direction of the touchpad using the Settings app. If you want to change the
scrolling direction of the mouse, you won't find an option, but you can modify
the Registry to complete the task.

In this Windows 10 guide, we'll walk you through the steps to reverse the
scrolling direction of your touchpad or mouse.

#### How To

Windows 10 supports reverse scrolling only on computers with a precision
touchpad. If the option isn't available, you may still be able to change the
scrolling behavior using the manufacturer's software for the peripheral.

To reverse the touchpad scrolling direction through Settings, use these steps:

* Open Settings.
* Click on Devices.
* Click on Touchpad.
* Under the "Scroll and zoom" section, use the drop-down menu to select the Down
motion scrolls down option.
* Touchpad Change Scroll Direction

Once you complete the steps, using the scrolling up gestures on the touchpad
will scroll pages in the downward direction for a more natural experience.

If you use a mouse to navigate the Windows 10 desktop, the Settings app does not
include an option to reverse the scrolling direction. However, you can still
modify the scrolling behavior using the Registry.

Warning: This is a friendly reminder that editing the Registry is risky, and it
can cause irreversible damage to your installation if you don't do it correctly.
Before proceeding, it's recommended to make a full backup of your computer.

#### Identifying mouse information

To identify the mouse identification number, use these steps:

* Open Start.
* Search for Device Manager, click the top result to open the app.
* Expand the Mice and other pointing devices branch.
* Right-click the active mouse and select the Properties option.
* Open mouse properties on Device Manager
* Click on the Details tab.
* Use the "Property" drop-down menu and choose the Device instance path option.
* Confirm the "VID ID" value for the mouse — for example, VID_0E0F&PID_0003&MI_01.

After you complete the steps, continue with the steps below to modify the
Registry to reverse the mouse scrolling.

#### Reverse mouse scrolling direction

To use the Registry to reverse the mouse scrolling direction, use these steps:

* Open Start.
* Search for regedit and click the top result to open the Registry Editor.
* Browse the following path:HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID
* Expand the key (folder) that matches the "VID ID" of your mouse — for example,
VID_0E0F&PID_0003&MI_01.
* Expand the available key.
* Select the Device Parameters key.
* Double-click the FlipFlopWheel DWORD and set the value from 0 to 1.
* Click OK.
* Restart your computer.

Once you complete the steps, when you scroll up with the mouse wheel, the page
should also scroll up.

If you change your mind, you can always revert the changes to their original
settings using the same instructions, but on step 7, make sure to set the value
from 1 to 0.

#### More Windows resources

For more helpful articles, coverage, and answers to common questions about
Windows 10 and Windows 11, visit the following resources:

Windows 11 on Windows Central — All you need to know
Windows 11 help, tips, and tricks
Windows 10 on Windows Central — All you need to know

Mauro Huculak

Mauro Huculak is technical writer for WindowsCentral.com. His primary focus is
to write comprehensive how-tos to help users get the most out of Windows 10 and
its many related technologies. He has an IT background with professional
certifications from Microsoft, Cisco, and CompTIA, and he's a recognized member
of the Microsoft MVP community.

© Future US, Inc. Full 7th Floor, 130 West 42nd Street, New York, NY 10036.
