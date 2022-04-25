# Plots trajectories in VMD, superposes to original PDB coordinates for selected DHF bound DHFR mutants (WT and L28R mutant here)
# In this sample, trajectories are smoothed (see mol smoothrep lines)
# Five different selections are made (protein, ligand DHF and three sets of residues in licorice)

package require pbctools
color Display Background white
display projection Orthographic
axes location Off

#input structure
animate read pdb dhfWT_step0.pdb
set sel0 [atomselect 0 "protein and name CA" frame 0] 

#############		WT (set 1)

set outfile2 [open WT_rmsd.txt w] 
mol load psf dhf-WT.psf
animate read dcd dhf-WT.dcd waitfor all

pbc wrap -centersel "protein" -center com -compound fragment -all

 set nf [molinfo top get numframes]
 set all [atomselect top "all"] 
 set sel1 [atomselect top "protein and name CA"] 

for { set i 0} { $i <= $nf-1 } { incr i } {
	$all frame $i
	$sel1 frame $i
		
	$all move [measure fit $sel1 $sel0]
	$sel1 update
		set rmsd [measure rmsd $sel1 $sel0]

	puts $outfile2 [format "%8d %8f" $i $rmsd]
	
}

mol modselect 0 top protein
mol modcolor 0 top colorid 6
mol modstyle 0 top NewCartoon 
mol addrep top
mol modselect 1 top "resname DHF"
mol modcolor 1 top name
mol modstyle 1 top licorice 0.3 30
mol addrep top
mol modselect 2 top "resid 52 57 and protein"
mol modcolor 2 top colorid 7
mol modstyle 2 top licorice 0.3 30
mol addrep top
mol modselect 3 top "resid 28 and protein"
mol modcolor 3 top colorid 11
mol modstyle 3 top licorice 0.3 30
mol addrep top
mol modselect 4 top "resid 26 and protein"
mol modcolor 4 top colorid 10
mol modstyle 4 top licorice 0.3 30
mol smoothrep top 0 10
mol smoothrep top 1 10
mol smoothrep top 2 10
mol smoothrep top 3 10
mol smoothrep top 4 10

close $outfile2

##############		L28R

set outfile2 [open L28R_rmsd.txt w] 
mol load psf dhf-l28r.psf
animate read dcd dhf-l28r.dcd waitfor all

pbc wrap -centersel "protein" -center com -compound fragment -all

 set nf [molinfo top get numframes]
 set all [atomselect top "all"] 
 set sel1 [atomselect top "protein and name CA"] 
 
for { set i 0} { $i <= $nf-1 } { incr i } {
	$all frame $i
	$sel1 frame $i
		
	$all move [measure fit $sel1 $sel0]
	$sel1 update
		set rmsd [measure rmsd $sel1 $sel0]

	puts $outfile2 [format "%8d %8f" $i $rmsd]
	
}


mol modselect 0 top protein
mol modcolor 0 top colorid 6
mol modstyle 0 top NewCartoon 
mol addrep top
mol modselect 1 top "resname DHF"
mol modcolor 1 top name
mol modstyle 1 top licorice 0.3 30
mol addrep top
mol modselect 2 top "resid 52 57 and protein"
mol modcolor 2 top colorid 7
mol modstyle 2 top licorice 0.3 30
mol addrep top
mol modselect 3 top "resid 28 and protein"
mol modcolor 3 top colorid 11
mol modstyle 3 top licorice 0.3 30
mol addrep top
mol modselect 4 top "resid 26 and protein"
mol modcolor 4 top colorid 10
mol modstyle 4 top licorice 0.3 30
mol smoothrep top 0 10
mol smoothrep top 1 10
mol smoothrep top 2 10
mol smoothrep top 3 10
mol smoothrep top 4 10

close $outfile2

################

	$sel0 delete; unset sel0

