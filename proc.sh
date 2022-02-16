grep RTL 1crb.pdb > RTL.pdb
gmx pdb2gmx -f 1crb.pdb -o 1CRB_processed.gro
gmx editconf -f rtl_ini.pdb -o rtl.gro
gmx editconf -f complex.gro -o newbox.gro -bt dodecahedron -d 1.0
gmx solvate -cp newbox.gro -cs spc216.gro -p topol.top -o solv.gro

gmx grompp -f ions.mdp -c solv.gro -p topol.top -o ions.tpr
