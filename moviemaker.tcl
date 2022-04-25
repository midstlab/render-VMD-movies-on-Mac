# Renders frames of loaded trajectory in VMD

set nf [molinfo top get numframes]
for { set i 0} { $i <= $nf-1 } { incr i } {
animate goto $i
render Tachyon dhfWT1.$i.dat "/Applications/VMD/VMD1.9.4a51.app/Contents/vmd/tachyon_MACOSXX86_64" dhfWT1.$i.dat -format PPM -o dhfWT1.$i.ppm

}
