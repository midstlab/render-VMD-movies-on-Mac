# render-VMD-movies-on-Mac

This will let you render high resolution movies of your trajectories using VMD and programs that come with a Mac by default. It also describes setting up your VMD parameters in a tcl script so that you don't have to go through the process every time.

1. Prepare your trajectories for VMD visualization in a tcl file. This should have superposition, coloring, smoothing choices. A sample is appended for a duplicate trajectory of E. Coli DHFR bound to DHF (forDHF_visuals.tcl).

Tip: To find out what the command lines are for a certain change you make from the VMD interface, in VMD open one trajectory, turn on ‘Load Tcl Commands to Console’ from the File menu and see what is written in the shell. You can copy these to your tcl script.

You can process several trajectories in the same tcl file by superposing on the same CA trace; this will work even if there are mutations. 

When you are happy, open VMD, and source your tcl script to get all your trajectories in the format you like best. Give the molecule the pose you wish to see when you create your movie product.

2. For each trajectory to visualize, turn on the display for that one only and source the second tcl script (moviemakerCA.tcl). This saves your output pictures, frame by frame in the same directory in .dat and .ppm formats. You will need the .ppm files for the next step.

3. Once the script stops running, open a terminal window on your Mac and source the next script (convert.txt). The sips command should already be installed on your Mac. This saves your output pictures, frame-by-frame, in .png format. 

4. Open QuickTime. Under 'File' select 'Open image sequence' and select the directory which has all your .png files. When you hit 'Choose media' your movie will be pu ttogether. You can save it with a suitable name before you exit QuickTime.

5. Delete your files with .png .dat and .ppm extensions

